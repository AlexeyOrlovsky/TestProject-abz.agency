//
//  AppCapsuleButton.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

private typealias CurrentView = AppCapsuleButton

struct AppCapsuleButton: View {
    // MARK: - Public Properties
    let label: String
    let action: () -> Void

    let minHeight: CGFloat
    let color: Color

    init(
        label: String,
        minHeight: CGFloat = 48,
        color: Color = .gray,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.minHeight = minHeight
        self.color = color
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
                .foregroundStyle(.white)
        }
        .buttonStyle(Style.Button.CapsuleButton(minHeight: self.minHeight, color: self.color))
    }
}

// MARK: - Previews
#if !RELEASE
struct AppCapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView(label: "Sign Up") { }
            .padding()
    }
}
#endif
