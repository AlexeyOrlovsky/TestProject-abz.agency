//
//  SuccessView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 20.08.2024.
//

import SwiftUI

private typealias Localization = AppLocale.SignUpSuccess
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
                image: Image(AppAssets.signUpSuccess.name),
                message: Localization.successfully,
                buttonText: Localization.buttonText,
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
            Image(AppAssets.close.name)
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
