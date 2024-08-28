//
//  UsersModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import SwiftUI
import Factory

private typealias Module = UsersModule

// MARK: - UsersModule
struct UsersModule {
    typealias ViewModelProtocol = UsersViewModelProtocol

    func assemble(_ configuration: Configuration? = nil) -> some View {
        let viewModel: ViewModel = .init()
        viewModel.moduleOutput = configuration?(viewModel)

        return MainView(viewModel: viewModel)
    }
}

extension Module {
    typealias ModuleInput = UsersModuleInput
    typealias ModuleOutput = UsersModuleOutput
    typealias Configuration = (ModuleInput) -> ModuleOutput?

    struct ConfigData {
        init() {}
    }
}

// MARK: - UsersViewModelProtocol
protocol UsersViewModelProtocol: ObservableObject {
    func onAppear()
}

// MARK: - HomeModuleInput
protocol UsersModuleInput: AnyObject {
    func configure(_ data: UsersModule.ConfigData)
}

// MARK: - HomeModuleOutput
protocol UsersModuleOutput: AnyObject {
    func usersModule(fetchData isLoading: Bool)
}
