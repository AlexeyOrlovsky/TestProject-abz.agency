//
//  ResUsersModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation

// MARK: - UserModel
extension ResponseModels {
    struct UserModel: Decodable {
        let success: Bool
        let page: Int
        let totalPages: Int
        let totalUsers: Int
        let count: Int
        let links: Links
        let users: [User]
    }
}

extension ResponseModels.UserModel {
    struct User: Decodable {
        let id: Int
        let name: String
        let email: String
        let phone: String
        let position: String
        let positionId: Int
        let photo: String
    }
}

extension ResponseModels.UserModel {
    struct Links: Decodable {
        let nextUrl: String?
        let prevUrl: String?
    }
}
