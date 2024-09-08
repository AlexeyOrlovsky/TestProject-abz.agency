//
//  ResSignUpModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 08.09.2024.
//

import Foundation

// MARK: - RegisterModel
extension ResponseModels {
    struct SignUpModel: Decodable {
        let success: Bool?
        let userId: Int?
        let message: String?
    }
}
