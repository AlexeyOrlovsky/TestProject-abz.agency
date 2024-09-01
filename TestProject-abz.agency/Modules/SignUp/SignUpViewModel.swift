//
//  SignUpViewModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import Foundation

private typealias Module = SignUpModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties

        // MARK: - Private Properties

        // MARK: - Services

        // MARK: - Managers

        // MARK: - Helpers
        private var cancellable: CancelBag = .init()

        // MARK: - Init
        init(
        ) {
        }

        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
        }

        // MARK: - Tap Actions
    }
}

// MARK: - Private Methods
private extension ViewModel {
}
