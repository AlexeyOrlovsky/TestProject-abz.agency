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
        let color: Color
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: .infinity, minHeight: minHeight)
                .background {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(configuration.isPressed ? color.opacity(0.8) : color)
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
                .foregroundStyle(.white)
        }
        .buttonStyle(Style.Button.CapsuleButton(minHeight: 48, color: .gray))
        .padding([.leading, .trailing], 16)
    }
}
#endif

