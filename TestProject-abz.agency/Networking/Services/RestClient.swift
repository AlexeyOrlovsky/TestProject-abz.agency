//
//  RestClient.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation
import Alamofire

// MARK: - BasePath
enum BasePath {
    static var baseApiUrl: String {
        #if RELEASE
        return "https://frontend-test-assignment-api.abz.agency"
        #else
        return "https://frontend-test-assignment-api.abz.agency"
        #endif
    }
}

// MARK: - ApiURLsPath
enum ApiURLsPath {
    static let baseApiUrl: String = "\(BasePath.baseApiUrl)/api/v1"
}

// MARK: - BaseResponseWrapped
typealias BaseResponseWrapped<T: Decodable> = Response<RestClient.BaseResponse<T>>
typealias BaseResponseWrappedV2<T: Decodable> = Response<RestClient.BaseResponseV2<T>>

// MARK: - RestClient
final class RestClient: NetworkingSession, InterceptorDelegate {
    struct BaseResponse<T: Decodable>: Decodable {
        let data: T
    }

    struct BaseResponseV2<T: Decodable>: Decodable {
        let data: T
        let errors: [ResponseError]

        struct ResponseError: Decodable, Error {
            let code: Int
            let message: String
        }
    }

    struct VoidObject: Decodable {
    }

    override init(baseURL: String = "") {
        super.init(baseURL: baseURL)

        self.interceptorDelegate = self
    }

    func retry(_ request: Request, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}

// MARK: - ResponseModels
enum ResponseModels { }
// MARK: - RequestModels
enum RequestModels { }
