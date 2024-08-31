//
//  InterfaceType+Extension.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 30.08.2024.
//

import Foundation
import Network

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .other,
        .wifi,
        .cellular,
        .loopback,
        .wiredEthernet
    ]
}
