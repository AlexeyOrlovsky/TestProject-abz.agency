//
//  SignUpService.swift
//  TestProject-abz.agency
//
//  Created Алексей Орловский on 08.09.2024.
//

import Foundation
import Alamofire

protocol SignUpService {
    func signUp(_ model: RequestModels.SignUpModel) async throws -> ResponseModels.SignUpModel
}

extension RequestRouter {
    enum SignUp {
        case signUp(RequestModels.SignUpModel)
    }
}

extension RequestRouter.SignUp: NetworkingRouterProtocol {
    var path: Endpoint {
        switch self {
            case .signUp:
                return "/users"
        }
    }

    var method: HTTPMethod {
        switch self {
            case .signUp:
                return .post
        }
    }
    
    var parameters: Encodable? {
        switch self {
            case .signUp(let data):
                return data
        }
    }

    var addAuth: Bool {
        switch self {
            case .signUp:
                return false
        }
    }

    var headers: HTTPHeaders? {
        switch self {
            case .signUp:
                return [
                    "Token":
                        "eyJpdiI6IitLK3V3M2NiN0ZNZ0Y0XC9ZNjJ1VlFRPT0iLCJ2YWx1ZSI6InhySUFJWThKQ1BmWDZvWHdKUFVBQnRWWkZMYjdnMzhmdWtuXC9xMEV1MnBrd1M3NHRUMWhxWFwva1wvZEk5R01cL01MaEZmdGg3UUVmM0h4bnJSR1wvSHVSS0E9PSIsIm1hYyI6IjUyNzUzNDE1YWFiMzIzMjI5MDJlMzQ5ODdlMWY1Mzg5Y2I5MjBhZGY2MGQ2MTM5OWJmZDA1ZGVjOWE4MWI2OTMifQ=="
                ]
        }
    }

    var withSnakeStyleEncoder: Bool {
        switch self {
            case .signUp:
                return true
        }
    }
}
