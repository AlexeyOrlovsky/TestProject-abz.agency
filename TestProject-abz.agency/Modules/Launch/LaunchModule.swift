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
    
    @Inject(\.networkMonitor) private var networkMonitor

    func assemble() -> some View {
        let viewModel: ViewModel = .init(networkMonitor: networkMonitor)

        return MainView(viewModel: viewModel)
    }
}

// MARK: - LaunchViewModelProtocol
protocol LaunchViewModelProtocol: ObservableObject {
    typealias NextScreen = LaunchModule.NextScreenStates
    
    var needsToOpenNextScreen: Bool { get }
    var openNextScreen: NextScreen { get }
    
    func onAppear()
}
