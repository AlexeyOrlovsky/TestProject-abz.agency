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
    
    @Inject(\.usersService) private var usersService

    @Inject(\.networkMonitor) private var networkMonitor

    func assemble(_ configuration: Configuration? = nil) -> some View {
        let viewModel: ViewModel = .init(usersService: usersService, networkMonitor: networkMonitor)
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
    typealias UserModel = UsersModule.UserModel
    typealias TabState = UsersModule.TabState
    
    var isLoadingNextPage: Bool { get }
    
    var uiState: TabState { get }
    var userModels: [UsersModule.UserModel] { get }
    var errorText: String { get }
    
    func onAppear()
    func fetchNextPage()
}

// MARK: - UsersModuleInput
protocol UsersModuleInput: AnyObject {
    func configure(_ data: UsersModule.ConfigData)
}

// MARK: - UsersModuleOutput
protocol UsersModuleOutput: AnyObject {
    func usersModule(fetchData isLoading: Bool)
}
