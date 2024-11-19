//
//  InterceptorProtocol.swift
//
//  Created Алексей Орловский on 04.07.2023.
//

import Foundation
import Alamofire

// MARK: - InterceptorDelegate
public protocol InterceptorDelegate: AnyObject {
    func adapt(_ urlRequest: URLRequest, completion: @escaping (Result<URLRequest, Error>) -> Void)
    func retry(_ request: Request, dueTo error: Error, completion: @escaping (RetryResult) -> Void)
}

public extension InterceptorDelegate {
    func adapt(_ urlRequest: URLRequest, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))
    }

    func retry(_ request: Request, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
