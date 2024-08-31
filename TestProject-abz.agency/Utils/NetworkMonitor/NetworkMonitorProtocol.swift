//
//  NetworkMonitorProtocol.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 30.08.2024.
//

import Foundation
import Network
import Combine

protocol NetworkMonitorProtocol: AnyObject {
    var isConnected: Bool { get }
    var isExpensive: Bool { get }
    var currentConnectionType: NWInterface.InterfaceType? { get }
    var isConnectedPublisher: AnyPublisher<Bool, Never> { get }

    func startMonitoring()
    func stopMonitoring()
}
