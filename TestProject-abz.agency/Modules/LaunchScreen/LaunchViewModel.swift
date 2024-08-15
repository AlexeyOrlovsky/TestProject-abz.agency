//
//  LaunchViewModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 15.08.2024.
//

import Foundation

private typealias Module = LaunchModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        private enum Constants {
            static let timeoutToClose: Int16 = 3
            static let fetchHistoryItemsPerPage: Int = 10
        }

        // MARK: - Public Properties
        @Published private(set) var needsToOpenNextScreen: Bool

        // MARK: - Private Properties
        private var timeoutValue: Int16
        private var timer: Timer.TimerPublisher

        // MARK: - Services

        // MARK: - Managers

        // MARK: - Helpers
        private var cancellable: CancelBag = .init()
        
        // MARK: - Init
        init(
        ) {
            self.needsToOpenNextScreen = false
            self.timeoutValue = .zero
            self.timer = Timer.publish(every: 1, on: .main, in: .common)
        }
        
        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
            
            setupObserving()
        }

        // MARK: - Tap Actions
    }
}

// MARK: - Private Methods
private extension ViewModel {
    func setupObserving() {
        self.timer
            .autoconnect()
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                guard let self = self else { return }

                if self.timeoutValue == Constants.timeoutToClose {
                    self.timer.connect().cancel()
                    self.needsToOpenNextScreen = true
                    return
                }

                self.timeoutValue += 1
            }
            .store(in: cancellable)
    }
}
