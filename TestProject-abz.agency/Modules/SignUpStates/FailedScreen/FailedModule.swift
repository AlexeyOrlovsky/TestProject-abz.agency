//
//  FailedModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 20.08.2024.
//

import SwiftUI

// MARK: - FailedModule
struct FailedModule {
    typealias ViewModelProtocol = FailedViewModelProtocol

    func assemble() -> some View {
        let viewModel: ViewModel = .init()

        return MainView(viewModel: viewModel)
    }
}

// MARK: - FailedViewModelProtocol
protocol FailedViewModelProtocol: ObservableObject {
    func onAppear()
}
