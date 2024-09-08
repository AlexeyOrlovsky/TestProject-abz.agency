//
//  MockSignUpService.swift
//  TestProject-abz.agency
//
//  Created Алексей Орловский on 08.09.2024.
//

import Foundation

struct MockSignUpService: MockableService, SignUpService {
    func signUp(_ model: RequestModels.SignUpModel) async throws -> ResponseModels.SignUpModel {
        try await sleepRequest()

        return .init(success: .none, userId: .none, message: .none)
    }
}

