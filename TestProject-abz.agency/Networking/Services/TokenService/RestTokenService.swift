//
//  RestTokenService.swift
//  TestProject-abz.agency
//
//  Created Алексей Орловский on 17.09.2024.
//

import Foundation

struct RestTokenService: BaseRestService {
    let restClient: NetworkingSessionProtocol
}

extension RestTokenService: TokenService {
    func fetchToken() async throws -> String {
        let request = try restClient.tryRequest(RequestRouter.Token.token)
        let response = await request.asyncResponseData()
        let result: Result<ResponseModels.TokenResponse, Error> = restClient.responseData(response)
        
        switch result {
        case .success(let tokenResponse):
            return tokenResponse.token
        case .failure(let error):
            throw error
        }
    }
}
