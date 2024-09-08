//
//  RestSignUpService.swift
//  TestProject-abz.agency
//
//  Created Алексей Орловский on 08.09.2024.
//

import Foundation

struct RestSignUpService: BaseRestService {
    let restClient: NetworkingSessionProtocol
}

extension RestSignUpService: SignUpService {
    func signUp(_ model: RequestModels.SignUpModel) async throws -> ResponseModels.SignUpModel {
        let request = try restClient.tryRequest(RequestRouter.SignUp.signUp(model))
        let response = await request.asyncResponseData()
        let result: BaseResponseWrappedV2<ResponseModels.SignUpModel> = restClient.responseData(response)

        switch result {
            case .success(let data):
                return data.data
            case .failure(let error):
                throw error
        }
    }
}
