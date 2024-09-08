//
//  ReqSignUpModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 08.09.2024.
//

import Foundation

// MARK: - SignUpModel
extension RequestModels {
    struct SignUpModel: Encodable {
        let name: String
        let email: String
        let phone: String
        let positionId: Int
        let photo: String
    }
}
