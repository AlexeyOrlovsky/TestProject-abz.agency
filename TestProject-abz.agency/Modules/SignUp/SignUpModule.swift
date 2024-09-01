//
//  SignUpModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

// MARK: - SignUpModule
struct SignUpModule {
    typealias ViewModelProtocol = SignUpViewModelProtocol

    func assemble() -> some View {
        let viewModel: ViewModel = .init()

        return MainView(viewModel: viewModel)
    }
}

// MARK: - SignUpViewModelProtocol
protocol SignUpViewModelProtocol: ObservableObject {
    func onAppear()
}
