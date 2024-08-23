//
//  SuccessView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 20.08.2024.
//

import SwiftUI

private typealias Module = SuccessModule
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
        ZStack {
            StatusView(
                image: Image("signUpSuccess"),
                message: "User successfully registered",
                buttonText: "Got it",
                buttonAction: {
                    debugPrint("Got it")
                }
            )
            .padding()
            
            VStack {
                HStack {
                    Spacer()
                    closeButton()
                }
                .padding(.top, 29)
                .padding(.trailing, 29)
                
                Spacer()
            }
        }
    }
    
    @ViewBuilder func closeButton() -> some View {
        Button {
            //
        } label: {
            Image("close")
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessModule().assemble()
            .previewDevice(.iPhone15Pro)
    }
}
#endif
