//
//  UsersService.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation
import Alamofire

protocol UsersService {
    func getUsers(_ model: RequestModels.Users) async throws -> [ResponseModels.UserModel.User]
}

extension RequestRouter {
    enum Users {
        case users(RequestModels.Users)
    }
}

extension RequestRouter.Users: NetworkingRouterProtocol {
    var path: Endpoint {
        switch self {
            case .users:
                return "/users"
        }
    }

    var method: HTTPMethod {
        switch self {
            case .users:
                return .get
        }
    }

    var parameters: Encodable? {
        switch self {
            case .users(let data):
                return data
        }
    }

    var addAuth: Bool {
        switch self {
            case .users:
                return true
        }
    }

    var headers: HTTPHeaders? {
        switch self {
            case .users:
                return nil
        }
    }

    var withSnakeStyleEncoder: Bool {
        switch self {
            case .users:
                return false
        }
    }
}
