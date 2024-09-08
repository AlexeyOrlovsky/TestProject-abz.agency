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
    
    @Inject(\.signUpService) private var signUpService

    func assemble() -> some View {
        let viewModel: ViewModel = .init(signUpService: signUpService)

        return MainView(viewModel: viewModel)
    }
}

// MARK: - SignUpViewModelProtocol
protocol SignUpViewModelProtocol: ObservableObject {
    var errorText: String { get }
    
    func didTapRegister(name: String, email: String, phone: String, positionId: Int, photo: String) async throws
    
    func onAppear()
}
