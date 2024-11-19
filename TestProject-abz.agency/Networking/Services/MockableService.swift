//
//  MockableService.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation

protocol MockableService { }

extension MockableService {
    /// 1 second sleep delay
    var sleepTime: UInt64 { 100_000_000_0 }

    func sleepRequest() async throws {
        try await Task.sleep(nanoseconds: sleepTime)
    }
}
