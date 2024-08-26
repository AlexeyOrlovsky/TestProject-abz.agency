//
//  SignUpView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

//private typealias Localization = AppLocale.SignUp
private typealias Module = SignUpModule
private typealias ModuleView = Module.MainView

// MARK: - MainView
extension Module {
    struct MainView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator

        // MARK: - Public Properties
        @State var state: TextFieldStates = .default
        
        @State var name: String = ""
        @State var email: String = ""
        @State var phone: String = ""

        // MARK: - Body
        var body: some View {
            content()
                .padding([.leading, .trailing], 16)
            .onAppear {
                self.viewModel.onAppear()
            }
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func content() -> some View {
        VStack(spacing: .zero) {
            VStack(spacing: 24) {
                Module.FormView(
                    name: $name,
                    email: $email,
                    phone: $phone
                )
                    .padding(.top, 32)
                Module.ListView(localizations: [
                    "Frontend developer",
                    "Backend developer",
                    "Designer",
                    "QA"
                ], selectedIndex: { index in
                    debugPrint("\(index)")
                }, state: state)
            }
            Spacer()
            AppCapsuleButton(
                label: "Sign up",
                action: {}
            )
            .padding(.bottom, 94)
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpModule().assemble()
            .previewDevice(.iPhone15Pro)
        SignUpModule().assemble()
            .previewDevice(.iPhoneSE_3rd)
    }
}
#endif
