//
//  UsersModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import Foundation

private typealias Module = UsersModule

extension Module {
    // MARK: - HistoryModel
    struct UserModel: Identifiable, Equatable {
        // MARK: - Public Properties
        var id: Int
        let name: String
        let email: String
        let phone: String
        let position_id: Int
        let position: String
        let photo: String

        // MARK: - Init
        init(
            id: Int,
            name: String,
            email: String,
            phone: String,
            position_id: Int,
            position: String,
            photo: String
        ) {
            self.id = id
            self.name = name
            self.email = email
            self.phone = phone
            self.position_id = position_id
            self.position = position
            self.photo = photo
        }
        
        init(from model: ResponseModels.UserModel.User) {
            self.id = model.id
            self.name = model.name
            self.email = model.email
            self.phone = model.phone
            self.position_id = model.positionId
            self.position = model.position
            self.photo = model.photo
        }
    }
}
