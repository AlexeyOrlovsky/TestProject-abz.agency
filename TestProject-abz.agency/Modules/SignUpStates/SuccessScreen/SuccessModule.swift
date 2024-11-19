//
//  SuccessModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 20.08.2024.
//

import SwiftUI

// MARK: - SuccessModule
struct SuccessModule {
    typealias ViewModelProtocol = SuccessViewModelProtocol

    func assemble() -> some View {
        let viewModel: ViewModel = .init()

        return MainView(viewModel: viewModel)
    }
}

// MARK: - SuccessViewModelProtocol
protocol SuccessViewModelProtocol: ObservableObject {
    func onAppear()
}
