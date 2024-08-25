//
//  LaunchModule.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 15.08.2024.
//

import SwiftUI

// MARK: - LaunchModule
struct LaunchModule {
    typealias ViewModelProtocol = LaunchViewModelProtocol

    func assemble() -> some View {
        let viewModel: ViewModel = .init()

        return MainView(viewModel: viewModel)
    }
}

// MARK: - LaunchViewModelProtocol
protocol LaunchViewModelProtocol: ObservableObject {
    var needsToOpenNextScreen: Bool { get }
    
    func onAppear()
}
