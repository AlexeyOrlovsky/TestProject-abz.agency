//
//  Date+Extension.swift
//
//  Created Алексей Орловский on 04.07.2023.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> Date {
        .init(timeIntervalSinceReferenceDate: lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate)
    }
}
