//
//  SignUpFormView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 25.08.2024.
//

import SwiftUI

//private typealias Localization = AppLocale.SignUp
private typealias Module = SignUpModule
private typealias CurrentView = Module.FormView

extension Module {
    struct FormView: View {
//        private enum Constants {
//            static let noEditingFieldKey = -1
//        }

        // typealias KeyboardField = LoginModule.KeyboardField

        // MARK: - Public Properties
        // @FocusState var keyboardActiveField: KeyboardField?
        @Binding var name: String
        @Binding var email: String
        @Binding var phone: String

        // MARK: - Dependencies
        // @EnvironmentObject var avoider: KeyboardAvoider

        // MARK: - Body
        var body: some View {
            content()
                .padding(.top, 36)
//                .onChange(of: self.keyboardActiveField) { keyboardActiveField in
//                    self.avoider.editingField = keyboardActiveField?.rawValue ?? Constants.noEditingFieldKey
//                }
        }
    }
}

// MARK: - Private Layout
extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack(spacing: 0) {
            AppTextField(
                placeholder: "Your Name",
                text: $name,
                state: .default,
                description: ""
            )
            AppTextField(
                placeholder: "Email",
                text: $email,
                state: .default,
                description: ""
            )
            AppTextField(
                placeholder: "Phone",
                text: $phone,
                state: .default,
                description: "+38 (XXX) XXX - XX - XX"
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
                    phone: $phone
                )
                .padding()
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}
#endif

