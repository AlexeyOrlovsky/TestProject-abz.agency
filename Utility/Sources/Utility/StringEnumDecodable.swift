//
//  StringEnumDecodable.swift
//
//
//  Created by Vyacheslav Razumeenko on 18.07.2024.
//

import Foundation

public protocol StringEnumDecodable: Decodable {
    static func decodeToCase(from string: String?) -> Self
}

public extension StringEnumDecodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try? container.decode(String.self)
        self = Self.decodeToCase(from: string)
    }

    static func stringType(of `case`: Self) -> String {
        String(describing: `case`)
    }
}
