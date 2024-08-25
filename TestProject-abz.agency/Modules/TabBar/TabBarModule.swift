//
//  TabBarModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 24.08.2024.
//

import SwiftUI
import Factory

// MARK: - TabBarModule
struct TabBarModule {
    typealias ViewModelProtocol = TabBarViewModelProtocol
    
    @Injected(\.usersModule) private var usersModule

    @Injected(\.signUpModule) private var signUpModule
    
    // @Injected(\.statisticsRepository) private var statisticsRepository
    // @Injected(\.toastsRepository) private var toastsRepository

    func assemble() -> some View {
        let viewModel: ViewModel = .init() // (statisticsRepository: statisticsRepository, toastsRepository: toastsRepository)

        return MainView(viewModel: viewModel, usersModule: usersModule)
    }
}

// MARK: - TabBarViewModelProtocol
protocol TabBarViewModelProtocol: ObservableObject {
    var selectedTab: TabBarModule.TabKeys { get set }
    var errorToastData: (text: String, binding: Binding<Bool>) { get }
    var isLoading: Bool { get }

    func onAppear()
}
