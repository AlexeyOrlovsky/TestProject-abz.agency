//
//  File.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

extension Style.TextField {
    struct WhiteCapsule: TextFieldStyle {
        var state: TextFieldStates

        func _body(configuration: TextField<Self._Label>) -> some View { // swiftlint:disable:this identifier_name
            configuration
                .frame(height: 56)
                .frame(maxWidth: .infinity)
                .padding([.leading, .trailing], 16)
                .backgroundWhiteRoundedRectangle(state: state)
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct WhiteCapsuleDemo_Previews: PreviewProvider {
    @State static private var text: String = ""
    @State static private var state: TextFieldStates = .default

    static var previews: some View {
        TextField("placeholder", text: $text)
            .textFieldStyle(Style.TextField.WhiteCapsule(state: state))
            .padding()
    }
}
#endif

