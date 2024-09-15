//
//  SignUpFormView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 25.08.2024.
//

import SwiftUI

private typealias Localization = AppLocale.SignUp
private typealias Module = SignUpModule
private typealias CurrentView = Module.FormView

extension Module {
    struct FormView: View {
        // MARK: - Public Properties
        @Binding var name: String
        @Binding var email: String
        @Binding var phone: String
        
        var nameState: TextFieldStates
        var emailState: TextFieldStates
        var phoneState: TextFieldStates

        // MARK: - Body
        var body: some View {
            content()
        }
    }
}

// MARK: - Private Layout
extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack(spacing: 12) {
            AppTextField(
                placeholder: Localization.nameField,
                text: $name,
                state: nameState,
                description: "",
                failedDescription: Localization.requiredField
            )
            AppTextField(
                placeholder: Localization.emailField,
                text: $email,
                state: emailState,
                description: "",
                failedDescription: Localization.emailInvalid
            )
            AppTextField(
                placeholder: Localization.phoneField,
                text: $phone,
                state: phoneState,
                description: Localization.phoneNumberExample,
                failedDescription: Localization.requiredField
            )
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct SignUpFormView_Previews: PreviewProvider {
    @State static private var name: String = "Alexey"
    @State static private var email: String = "morrterry2021@gmail.com"
    @State static private var phone: String = "+38 0688785853"
    
    static var previews: some View {
        GeometryReader { proxy in
            VStack {
                CurrentView(
                    name: $name,
                    email: $email,
                    phone: $phone,
                    nameState: .default,
                    emailState: .default,
                    phoneState: .default
                )
                .padding()
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}
#endif

