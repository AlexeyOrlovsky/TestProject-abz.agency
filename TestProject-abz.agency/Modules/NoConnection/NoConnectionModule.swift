//
//  NoConnectionModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 16.08.2024.
//

import SwiftUI

// MARK: - NoConnectionModule
struct NoConnectionModule {
    typealias ViewModelProtocol = NoConnectionViewModelProtocol

    func assemble() -> some View {
        let viewModel: ViewModel = .init()

        return MainView(viewModel: viewModel)
    }
}

// MARK: - NoConnectionViewModelProtocol
protocol NoConnectionViewModelProtocol: ObservableObject {
    func onAppear()
}
