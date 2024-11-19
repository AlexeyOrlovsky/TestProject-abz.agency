//
//  NetworkingError.swift
//
//  Created Алексей Орловский on 04.07.2023.
//

import Foundation

public enum NetworkingError: Error {
    case clientError(String)
}

extension NetworkingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .clientError(let string):
                return string
        }
    }
}

// MARK: - ServerError
public typealias ServerError = Decodable & Error

// MARK: - ErrorObject
public struct ErrorObject: ServerError {
    struct Entity: Decodable {
        let code: Int
        let message: String
    }

    let errors: [Entity]
}
