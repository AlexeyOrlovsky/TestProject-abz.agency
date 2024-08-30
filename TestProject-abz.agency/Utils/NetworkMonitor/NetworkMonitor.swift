//
//  NetworkMonitor.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 30.08.2024.
//

import Foundation
import Network
import Combine

class NetworkMonitor: ObservableObject, NetworkMonitorProtocol {
    private enum Constants {
        static let queueID = "com.networkMonitor.queue"

        static let logSepartor: String = "🛜"
    }

    // MARK: - Public Properties
    var isConnectedPublisher: AnyPublisher<Bool, Never> {
        $isConnected.eraseToAnyPublisher()
    }

    @Published private(set) var isConnected = false
    private(set) var isExpensive = false
    private(set) var currentConnectionType: NWInterface.InterfaceType?

    // MARK: - Private Properties
    private let queue: DispatchQueue = .init(label: Constants.queueID, qos: .background)
    private let monitor: NWPathMonitor

    private var hasStatus: Bool = false

    // MARK: - Init
    init() {
        monitor = .init()
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            #if targetEnvironment(simulator)
            self.onPathUpdateOnSimulator(path)
            #else
            self.onPathUpdate(path)
            #endif
        }
        self.startMonitoring()
    }

    // MARK: - Public Methods
    func startMonitoring() {
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}

// MARK: - Private Methods
private extension NetworkMonitor {
    #if targetEnvironment(simulator)
    func onPathUpdateOnSimulator(_ newPath: NWPath) {
        if (!self.hasStatus) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isConnected = newPath.status == .satisfied
            }
            self.hasStatus = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isConnected = !self.isConnected
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isExpensive = newPath.isExpensive
            self.currentConnectionType = NWInterface.InterfaceType.allCases
                .filter { newPath.usesInterfaceType($0) }
                .first

            AppLog.debug(Constants.logSepartor, "interfaces: \(NWInterface.InterfaceType.allCases.filter { newPath.usesInterfaceType($0) })")
            AppLog.debug(Constants.logSepartor, "isConnected: \(self.isConnected)")
            AppLog.debug(Constants.logSepartor, "isExpensive: \(self.isExpensive)")
            AppLog.debug(Constants.logSepartor, "currentConnectionType: \(String(describing: self.currentConnectionType))")

            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
    }
    #endif

    func onPathUpdate(_ newPath: NWPath) {
        self.isConnected = newPath.status == .satisfied
        self.isExpensive = newPath.isExpensive
        self.currentConnectionType = NWInterface.InterfaceType.allCases
            .filter { newPath.usesInterfaceType($0) }
            .first

        AppLog.debug(Constants.logSepartor, "interfaces: \(NWInterface.InterfaceType.allCases.filter { newPath.usesInterfaceType($0) })")
        AppLog.debug(Constants.logSepartor, "isConnected: \(isConnected)")
        AppLog.debug(Constants.logSepartor, "isExpensive: \(isExpensive)")
        AppLog.debug(Constants.logSepartor, "currentConnectionType: \(String(describing: currentConnectionType))")

        Task {
            await MainActor.run {
                self.objectWillChange.send()
            }
        }
    }
}
