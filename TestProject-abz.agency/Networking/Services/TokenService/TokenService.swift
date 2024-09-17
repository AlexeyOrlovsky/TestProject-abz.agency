//
//  TokenService.swift
//  TestProject-abz.agency
//
//  Created Алексей Орловский on 17.09.2024.
//

import Foundation
import Alamofire

var globalAuthToken: String?

protocol TokenService { 
    func fetchToken() async throws -> String
}

extension RequestRouter {
    enum Token {
        case token
    }
}

extension RequestRouter.Token: NetworkingRouterProtocol {
    var path: Endpoint {
        switch self {
            case .token:
                return "/token"
        }
    }

    var method: HTTPMethod {
        switch self {
            case .token:
                return .get
        }
    }

    var parameters: Encodable? {
        switch self {
            case .token:
                return nil
        }
    }

    var addAuth: Bool {
        switch self {
            case .token:
                return false
        }
    }
}
