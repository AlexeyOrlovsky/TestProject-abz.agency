//
//  AppCapsuleButton.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

private typealias CurrentView = AppCapsuleButton
typealias CapsuleButtonStates = AppCapsuleButton.CapsuleButtonStates

struct AppCapsuleButton: View {
    // MARK: - Button States
    enum CapsuleButtonStates {
        case normal
        case disabled
        
        var color: Color {
            switch self {
            case .normal:
                AppColors.primaryColor.colorSwiftUI
            case .disabled:
                .borderGray
            }
        }
    }
    
    // MARK: - Public Properties
    let label: String
    let action: () -> Void

    let minHeight: CGFloat
    let state: CapsuleButtonStates

    init(
        label: String,
        minHeight: CGFloat = 48,
        state: CapsuleButtonStates = .normal,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.minHeight = minHeight
        self.state = state
        self.action = action
    }

    // MARK: - Body
    var body: some View {
        content()
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        Button {
            self.action()
        } label: {
            Text(self.label)
                .appFontSemiBoldSize18()
                .foregroundStyle(.textBlack)
        }
        .buttonStyle(
            Style.Button.CapsuleButton(
                minHeight: self.minHeight,
                state: self.state
            )
        )
    }
}

// MARK: - Previews
#if !RELEASE
struct AppCapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView(label: "Sign Up", state: .normal) { }
            .padding()
    }
}
#endif
