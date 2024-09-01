//
//  Button+Style.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

extension Style.Button {
    struct CapsuleButton: ButtonStyle {
        let minHeight: CGFloat
        var state: CapsuleButtonStates
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: .infinity, minHeight: minHeight)
                .background {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            configuration.isPressed
                            ? AppColors.darkPrimaryColor.colorSwiftUI
                            : state.color
                        )
                        .frame(width: 140)
                }
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct CapsuleButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            ()
        } label: {
            Text("Sign up")
                .foregroundStyle(AppColors.textBlack.colorSwiftUI)
        }
        .buttonStyle(Style.Button.CapsuleButton(minHeight: 48, state: .normal))
        .padding([.leading, .trailing], 16)
    }
}
#endif

