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
                .font(.title3)
                .multilineTextAlignment(.center)
            Button(
                action: buttonAction
            ) {
                Text(buttonText)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("PrimaryColor"))
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
            image: Image("noInternetConnection"),
            message: "There is no internet connection",
            buttonText: "Try again",
            buttonAction: {
                debugPrint("Try again")
            }
        )
    }
}
#endif
