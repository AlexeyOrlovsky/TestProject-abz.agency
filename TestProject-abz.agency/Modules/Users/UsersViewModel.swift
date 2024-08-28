//
//  UsersViewModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import Foundation

private typealias Module = UsersModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published private(set) var uiState: TabState = .withData
        
        // MARK: - Dependencies
        weak var moduleOutput: ModuleOutput?

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

// MARK: - ModuleInput
extension ViewModel: Module.ModuleInput {
    func configure(_ data: UsersModule.ConfigData) { }
}

// MARK: - Private Methods
private extension ViewModel {
}
