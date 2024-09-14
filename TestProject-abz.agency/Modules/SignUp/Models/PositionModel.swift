//
//  PositionModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 13.09.2024.
//

import Foundation

private typealias Module = SignUpModule

extension Module {
    // MARK: - Position
    struct PositionModel: Decodable {
        let id: Int
        let name: String
        
        init(
            id: Int,
            name: String
        ) {
            self.id = id
            self.name = name
        }
        
        init(from model: ResponseModels.PositionModel.Position) {
            self.id = model.id
            self.name = model.name
        }
    }
}
