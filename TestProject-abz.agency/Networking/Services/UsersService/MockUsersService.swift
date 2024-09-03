//
//  MockUsersService.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation

struct MockUsersService: MockableService, UsersService {
    func getUsers(_ model: RequestModels.Users) async throws -> [ResponseModels.UserModel.User] {
        try await sleepRequest()

        return []
    }
}
