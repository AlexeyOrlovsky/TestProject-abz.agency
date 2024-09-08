//
//  NetworkingSessionProtocol.swift
//
//  Created Алексей Орловский on 04.07.2023.
//

import Foundation
import Alamofire

public protocol NetworkingSessionProtocol: AnyObject {
    var sessionManager: Session { get }
    var decoder: JSONDecoder { get }
    var encoder: JSONEncoder { get }

    var authCredential: OAuthAuthenticator.OAuthCredential? { get set }
    var authDelegate: OAuthAuthenticatorDelegate? { get set }
    var interceptorDelegate: InterceptorDelegate? { get set }

    func tryRequest(_ type: NetworkingRouterProtocol) throws -> DataRequest
    func request(_ type: NetworkingRouterProtocol) -> DataRequest?
    func uploadFile(_ type: UploadRouterProtocol) -> DataRequest?

    func responseData<T: Decodable>(_ response: AFDataResponse<Data>) -> Result<T, Error>
    func responseDataOptionally<T: Decodable>(_ response: AFDataResponse<Data>) -> Result<T?, Error>

    func objectFromData<T: Decodable>(_ data: Data) throws -> T
}
