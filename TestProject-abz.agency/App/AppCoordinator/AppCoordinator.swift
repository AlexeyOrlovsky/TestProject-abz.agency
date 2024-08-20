//
//  AppCoordinatorView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 15.08.2024.
//

import FlowStacks
import SwiftUI

private typealias Module = AppCoordinatorModule

// MARK: - AppCoordinator
extension Module {
    struct AppCoordinator<ViewModel: ViewModelProtocol>: View {
        @StateObject var viewModel: ViewModel
        
        // MARK: - Private
        @Inject(\.launchModule) private var launchModule
        @Inject(\.noConnectionModule) private var noConnectionModule
        @Inject(\.signUpSuccessModule) private var signUpSuccessModule
        @Inject(\.signUpFailedModule) private var signUpFailedModule
        
        var body: some View {
            Router(viewModel.routes) { screen, _ in
                switch screen {
                case .launch:
                    launchModule.assemble()
                case .noConnection:
                    noConnectionModule.assemble()
                case .signUpSuccess: 
                    signUpSuccessModule.assemble()
                case .signUpFailed:
                    signUpFailedModule.assemble()
                }
            }
        }
    }
}
