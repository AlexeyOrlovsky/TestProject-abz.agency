//
//  ResToken.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 17.09.2024.
//

import Foundation

// MARK: - TokenResponse
extension ResponseModels {
    struct TokenResponse: Decodable {
        let token: String
    }
}
