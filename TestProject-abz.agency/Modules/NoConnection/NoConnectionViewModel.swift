//
//  NoConnectionViewModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 16.08.2024.
//

import Foundation

private typealias Module = NoConnectionModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published private(set) var isConnected: Bool = false

        // MARK: - Private Properties

        // MARK: - Services

        // MARK: - Managers
        private let networkMonitor: NetworkMonitorProtocol

        // MARK: - Helpers
        private var cancellable: CancelBag = .init()

        // MARK: - Init
        init(networkMonitor: NetworkMonitorProtocol
        ) {
            self.networkMonitor = networkMonitor
        }

        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
        }

        // MARK: - Tap Actions
        func connectionState() {
            if networkMonitor.isConnected {
                isConnected = true
            }
        }
    }
}

// MARK: - Private Methods
private extension ViewModel {
}
