//
//  RestUsersService.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation

struct RestUsersService: BaseRestService {
    let restClient: NetworkingSessionProtocol
}

extension RestUsersService: UsersService {
    func getUsers(_ model: RequestModels.Users) async throws -> [ResponseModels.UserModel.User] {
        let request = try restClient.tryRequest(RequestRouter.Users.users(model))
        let response = await request.asyncResponseData()
        let result: Result<ResponseModels.UserModel, Error> = restClient.responseData(response)
        
        switch result {
        case .success(let data):
            return data.users
        case .failure(let error):
            throw error
        }
    }
}
