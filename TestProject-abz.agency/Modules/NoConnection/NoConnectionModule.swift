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
    
    @Inject(\.networkMonitor) private var networkMonitor

    func assemble() -> some View {
        let viewModel: ViewModel = .init(networkMonitor: networkMonitor)

        return MainView(viewModel: viewModel)
    }
}

// MARK: - NoConnectionViewModelProtocol
protocol NoConnectionViewModelProtocol: ObservableObject {
    var isConnected: Bool { get }
    
    func connectionState()
    func onAppear()
}
