//
//  StatusView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 16.08.2024.
//

import SwiftUI

private typealias CurrentView = StatusView

struct StatusView: View {
    
    // MARK: - Public Properties
    var image: Image
    var message: String
    var buttonText: String
    var buttonAction: () -> Void
    
    // MARK: - Private Properties
    private let textColor = Color(.textBlack)
    
    // MARK: - Body
    var body: some View {
        content()
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack(spacing: 24) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text(message)
                .appFontRegularSize20()
                .foregroundStyle(textColor)
                .multilineTextAlignment(.center)
            Button(
                action: buttonAction
            ) {
                Text(buttonText)
                    .appFontRegularSize18()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(textColor)
                    .background(AppColors.primaryColor.colorSwiftUI)
                    .cornerRadius(35)
            }
            .frame(width: 140, height: 48)
        }
        .padding()
    }
}

// MARK: - Private Methods
private extension CurrentView {
}

// MARK: - Previews
#if !RELEASE
struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(
            image: Image(AppAssets.noInternetConnection.name),
            message: "There is no internet connection",
            buttonText: "Try again",
            buttonAction: {
                debugPrint("Try again")
            }
        )
    }
}
#endif
