//
//  ReqUsers.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation

// MARK: - UserModel
extension RequestModels {
    struct Users: Encodable {
        let page: Int
        let count: Int
    }
}
