//
//  NetworkingSession.swift
//
//  Created Алексей Орловский on 04.07.2023.
//

import Foundation
import Alamofire

public typealias Response<T: Decodable> = Result<T, Error>

open class NetworkingSession: NetworkingSessionProtocol {
    private var baseURL: URL?

    private let eventMonitor: BaseEventMonitor = .init()
    private let requestInterceptor: BaseRequestInterceptor = .init()

    private let rootQueue: DispatchQueue
    private let requestQueue: DispatchQueue
    private let serializationQueue: DispatchQueue
    private let configuration: URLSessionConfiguration

    private let authenticator = OAuthAuthenticator()
    private var authInterceptor: AuthenticationInterceptor<OAuthAuthenticator>?

    public var authCredential: OAuthAuthenticator.OAuthCredential? {
        didSet {
            guard
                let authCredential = authCredential
            else {
                authInterceptor = nil
                return
            }

            authInterceptor = .init(authenticator: authenticator, credential: authCredential)
        }
    }

    public weak var authDelegate: OAuthAuthenticatorDelegate? {
        didSet {
            authenticator.delegate = authDelegate
        }
    }

    public weak var interceptorDelegate: InterceptorDelegate? {
        didSet {
            requestInterceptor.delegate = interceptorDelegate
        }
    }
    public var onUnauthorizedCallback: (() -> Void)?

    public private(set) var sessionManager: Session

    public private(set) var decoder: JSONDecoder = JSONDecoder()
    public private(set) var encoder: JSONEncoder = JSONEncoder()

    public init(baseURL: String) {
        self.baseURL = URL(string: baseURL)

        self.rootQueue = DispatchQueue(label: "\(baseURL).\(Bundle.main.bundleIdentifier ?? "").rootQueue")
        self.requestQueue = DispatchQueue(label: "\(baseURL).\(Bundle.main.bundleIdentifier ?? "").requestQueue")
        self.serializationQueue = DispatchQueue(label: "\(baseURL).\(Bundle.main.bundleIdentifier ?? "").serializationQueue")

        self.configuration = URLSessionConfiguration.af.default
        self.configuration.timeoutIntervalForRequest = 30
        self.configuration.waitsForConnectivity = true
        self.configuration.requestCachePolicy = .reloadRevalidatingCacheData

        self.sessionManager = .init(
            configuration: configuration,
            rootQueue: rootQueue,
            startRequestsImmediately: true,
            requestQueue: requestQueue,
            serializationQueue: serializationQueue,
            interceptor: requestInterceptor,
            cachedResponseHandler: ResponseCacher(behavior: .cache),
            eventMonitors: [ eventMonitor ]
        )

        self.commonSetup()
    }

    private func commonSetup() {
        configurateDecoder()
        configurateSnakeCaseEncoder()
    }

    private func configurateDecoder() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
    }

    private func configurateSnakeCaseEncoder() {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .secondsSince1970
        encoder.outputFormatting = .prettyPrinted
    }

    private func configurateDefaultEncoder() {
        encoder.keyEncodingStrategy = .useDefaultKeys
        encoder.dateEncodingStrategy = .secondsSince1970
        encoder.outputFormatting = .prettyPrinted
    }

    public func tryRequest(_ type: NetworkingRouterProtocol) throws -> DataRequest {
        guard
            let request = request(type)
        else {
            throw URLError(.badURL)
        }

        return request
    }

    public func request(_ type: NetworkingRouterProtocol) -> DataRequest? {
        guard let baseURL = baseURL else { return nil }

        if type.method == .post || !type.withSnakeStyleEncoder {
            configurateDefaultEncoder()
        } else {
            configurateSnakeCaseEncoder()
        }

        let parameters: Parameters? = type.parameters?.asDictionary(encoder: self.encoder)

        return sessionManager.request(
            baseURL.appendingPathComponent(type.path),
            method: type.method,
            parameters: parameters,
            encoding: type.encoder,
            headers: type.headers,
            interceptor: type.addAuth ? authInterceptor : nil
        )
    }

//    public func request(_ type: NetworkingRouterProtocol) -> DataRequest? {
//        guard let baseURL = baseURL else { return nil }
//
////        let parameters: Parameters? = type.parameters?.asDictionary(encoder: self.encoder)
//
////        let enc: Encodable? = type.parameters
//        let model: RequestModels.RegisterCreditCardModel = .init(number: "4321123443211234", userId: 1)
//
//        return sessionManager.request(
//            baseURL.appendingPathComponent(type.path),
//            method: type.method,
//            parameters: model,
//            encoder: JSONParameterEncoder.default,
//            headers: type.headers,
//            interceptor: type.addAuth ? authInterceptor : nil
//        )
//    }

    public func uploadFile(_ type: UploadRouterProtocol) -> DataRequest? {
        guard
            let baseURL = baseURL,
            let inputStream = InputStream(url: type.fileURL)
        else {
            return nil
        }

        return sessionManager.upload(
            multipartFormData: {
                $0.append(
                    inputStream,
                    withLength: UInt64(type.fileURL.fileSize),
                    name: type.fileName,
                    fileName: "\(type.fileName)\(type.fileType)",
                    mimeType: type.mimeType
                )
            },
            to: baseURL.appendingPathComponent(type.path),
            method: type.method,
            headers: type.headers,
            interceptor: type.addAuth ? authInterceptor : nil
        )
    }

    public func responseData<T: Decodable>(_ response: AFDataResponse<Data>) -> Result<T, Error> {
        let result = processResponse(response)

        switch result {
            case .success(let data):
                do {
                    let object: T = try self.objectFromData(data)
                    return .success(object)
                } catch let error {
                    debugPrint("cannotDecodeContentData error: \(error)")
                    return .failure(URLError(.cannotDecodeContentData))
                }
            case .failure(let error):
                return .failure(error)
        }
    }

    public func responseDataOptionally<T: Decodable>(_ response: AFDataResponse<Data>) -> Result<T?, Error> {
        let result = processResponse(response)

        switch result {
            case .success(let data):
                if data.isEmpty {
                    return .success(nil)
                } else {
                    do {
                        let object: T = try self.objectFromData(data)
                        return .success(object)
                    } catch let error {
                        debugPrint("cannotDecodeOptionalContentData error: \(error)")
                        return .failure(URLError(.cannotDecodeContentData))
                    }
                }
            case .failure(let error):
                return .failure(error)
        }
    }

    public func objectFromData<T: Decodable>(_ data: Data) throws -> T {
        do {
            let object = try self.decoder.decode(T.self, from: data)
            return object
        } catch DecodingError.dataCorrupted(let context) {
            throw DecodingError.dataCorrupted(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            throw DecodingError.keyNotFound(key, context)
        } catch DecodingError.typeMismatch(let type, let context) {
            throw DecodingError.typeMismatch(type, context)
        } catch DecodingError.valueNotFound(let value, let context) {
            throw DecodingError.valueNotFound(value, context)
        } catch let error {
            throw error
        }
    }

    public func errorObjectFromData<T: ServerError>(_ data: Data) -> T? {
        do {
            let object = try self.decoder.decode(T.self, from: data)
            return object
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}

// MARK: - Private Methods
private extension NetworkingSession {
    func processResponse(_ response: AFDataResponse<Data>) -> Result<Data, Error> {
        switch response.result {
            case .success(let data):
                guard
                    let responseType = response.response?.status?.responseType
                else {
                    return .failure(URLError(.badServerResponse))
                }

                switch responseType {
                    case .clientError, .serverError:
                        guard
//                            let _ = data.convertToDictionary()
                            data.convertToDictionary() != nil
                        else {
                            return .failure(URLError(.badServerResponse))
                        }

                        if let errorObject: ErrorObject = errorObjectFromData(data) {
                            debugPrint("ℹ️ \(errorObject)")
                            let errorText = errorObject.errors.first?.message ?? .init() // AppLocale.Network.Error.default
                            let error: Error = NetworkingError.clientError(errorText)

                            if errorObject.errors.first?.code == HTTPURLResponse.HTTPStatusCode.unauthorized.rawValue {
                                DispatchQueue.main.async { [weak self] in
                                    self?.onUnauthorizedCallback?()
                                }
                            }

                            return .failure(error)
                        }

                    let error: Error = NetworkingError.clientError(.init()) // AppLocale.Network.Error.default

                        return .failure(error)
                    default:
                        break
                }

                return .success(data)
            case .failure(let error):
                return .failure(error)
        }
    }
}

// MARK: - Encodable Extension
private extension Encodable {
    func asDictionary(encoder: JSONEncoder) -> [String: Any]? {
        do {
            let data = try encoder.encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]

            return dictionary
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
