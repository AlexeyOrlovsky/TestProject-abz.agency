//
//  ResPositions.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 13.09.2024.
//

import Foundation

// MARK: - UserModel
extension ResponseModels {
    struct PositionModel: Decodable {
        let success: Bool
        let positions: [Position]
    }
}

extension ResponseModels.PositionModel {
    struct Position: Decodable {
        let id: Int
        let name: String
    }
}
