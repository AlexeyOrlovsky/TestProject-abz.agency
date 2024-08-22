//
//  UsersModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import SwiftUI

// MARK: - UsersModule
struct UsersModule {
    typealias ViewModelProtocol = UsersViewModelProtocol

    func assemble() -> some View {
        let viewModel: ViewModel = .init()

        return MainView(viewModel: viewModel)
    }
}

// MARK: - UsersViewModelProtocol
protocol UsersViewModelProtocol: ObservableObject {
    func onAppear()
}
