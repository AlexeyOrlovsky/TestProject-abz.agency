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
    func getPositions(_ model: RequestModels.Positions) async throws -> [ResponseModels.PositionModel.Position]
}

extension RequestRouter {
    enum SignUp {
        case signUp(RequestModels.SignUpModel)
        case positions(RequestModels.Positions)
    }
}

extension RequestRouter.SignUp: NetworkingRouterProtocol {
    var path: Endpoint {
        switch self {
            case .signUp:
                return "/users"
            case .positions:
                return "/positions"
        }
    }

    var method: HTTPMethod {
        switch self {
            case .signUp:
                return .post
            case .positions:
                return .get
        }
    }
    
    var parameters: Encodable? {
        switch self {
            case .signUp(let data):
                return data
            case .positions(let data):
                return data
        }
    }

    var addAuth: Bool {
        switch self {
            case .signUp:
                return false
            case .positions:
                return true
        }
    }

    var headers: HTTPHeaders? {
        switch self {
            case .signUp:
                return [
                    "Token":
                        "eyJpdiI6IjNXaEFPUFRWa2Q1RE5VQVdsY1hianc9PSIsInZhbHVlIjoiRkRzaGlxTzFUK2Fhb1NnNUQ1dU5tdnNQRTRSeGdBNTZMZytDNVRqb1NmUWZrbDJWdlBiQTYwZVR2eWdRR1FFMGo5TmhValFiXC9VdzNGZVpqcXdQd21BPT0iLCJtYWMiOiJkNTM0OTJjZmZjMGUxZjkwMjdiNDE4NTI1NGRmMmI3NmQ0ODFhYTA3OWFkMTRmZGI0M2IzYjM4NTAzMGQwNmU5In0="
                ]
            case .positions:
                return nil
        }
    }

    var withSnakeStyleEncoder: Bool {
        switch self {
            case .signUp:
                return true
            case .positions:
                return false
        }
    }
}
