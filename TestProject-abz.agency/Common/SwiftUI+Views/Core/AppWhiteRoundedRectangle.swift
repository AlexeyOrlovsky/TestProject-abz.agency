//
//  AppWhiteRoundedRectangle.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

private enum Constants {
    static let defaultCornerRadius: CGFloat = 4
    static let defaultCorners: UIRectCorner = .allCorners
}

private typealias CurrentView = AppWhiteRoundedRectangle
typealias TextFieldStates = AppWhiteRoundedRectangle.TextFieldStates

// MARK: - Extension
extension View {
    func backgroundWhiteRoundedRectangle(
        corners: UIRectCorner = Constants.defaultCorners,
        cornerRadius: CGFloat = Constants.defaultCornerRadius,
        state: TextFieldStates = .default
    ) -> some View {
        self.background {
            AppWhiteRoundedRectangle(
                corners: corners,
                cornerRadius: cornerRadius,
                state: state
            )
        }
    }
}

// MARK: - AppWhiteRoundedRectangle
struct AppWhiteRoundedRectangle: View {
    // MARK: - Text Field States
    enum TextFieldStates {
        case `default`
        case failed
        
        var color: Color {
            switch self {
            case .default:
                Color.gray.opacity(0.5)
            case .failed:
                Color.red
            }
        }
    }
    
    // MARK: - Public Properties
    let corners: UIRectCorner
    let state: TextFieldStates
    
    // MARK: - Private Properties
    private let cornerRadius: CGFloat
    
    // MARK: - Init
    init(
        corners: UIRectCorner = Constants.defaultCorners,
        cornerRadius: CGFloat = Constants.defaultCornerRadius,
        state: TextFieldStates
    ) {
        self.corners = corners
        self.cornerRadius = cornerRadius
        self.state = state
    }
    
    // MARK: - Body
    var body: some View {
        content()
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        RoundedCornersShape(corners: corners, radius: cornerRadius)
            .stroke(state.color, lineWidth: 1.0)
            .background {
                RoundedCornersShape(corners: corners, radius: cornerRadius)
                    .fill(.white)
            }
    }
}

// MARK: - Previews
#if !RELEASE
struct AppWhiteRoundedRectangle_Previews: PreviewProvider {
    @State static private var state: TextFieldStates = .default
    static var previews: some View {
        CurrentView(state: state)
            .padding()
        
        CurrentView(corners: [.topLeft, .topRight], state: state)
            .padding()
    }
}
#endif
