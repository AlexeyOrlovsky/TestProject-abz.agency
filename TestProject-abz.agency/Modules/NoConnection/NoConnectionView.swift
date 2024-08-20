//
//  NoConnectionView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 16.08.2024.
//

import SwiftUI

private typealias Module = NoConnectionModule
private typealias ModuleView = Module.MainView

// MARK: - MainView
extension Module {
    struct MainView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator

        // MARK: - Body
        var body: some View {
            content()
                .onAppear(perform: self.viewModel.onAppear)
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func content() -> some View {
        StatusView(
            image: Image("noInternetConnection"),
            message: "There is no internet connection",
            buttonText: "Try again",
            buttonAction: {
                debugPrint("Try again")
            }
        )
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionModule().assemble()
    }
}
#endif
