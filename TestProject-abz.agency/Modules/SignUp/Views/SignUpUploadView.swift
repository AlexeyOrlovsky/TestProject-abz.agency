//
//  UploadView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 28.08.2024.
//

import SwiftUI

private typealias Localization = AppLocale.SignUp
private typealias Module = SignUpModule
private typealias CurrentView = Module.SignUpUploadView

extension Module {
    struct SignUpUploadView: View {
        // MARK: - Public Properties
        let text: String
        let description: String
        let buttonAction: () -> Void
        var state: TextFieldStates
        
        // MARK: Private Properties
        
        // MARK: - Init
        init(
            text: String,
            description: String = "",
            buttonAction: @escaping () -> Void,
            state: TextFieldStates = .default
        ) {
            self.text = text
            self.description = description
            self.buttonAction = buttonAction
            self.state = state
        }
        
        // MARK: - Body
        var body: some View {
            content()
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack(spacing: 4) {
            HStack {
                Text(text)
                    .appFontRegularSize16()
                    .foregroundStyle(AppColors.textPrimary.colorSwiftUI)
                Spacer()
                Button {
                    //
                } label: {
                    Text(Localization.upload)
                        .foregroundStyle(AppColors.secondaryColor.colorSwiftUI)
                }
                
            }
            .frame(height: 56)
            .padding([.trailing, .leading], 16)
            .backgroundWhiteRoundedRectangle(state: state == .default ? .default : .failed)
            
            failedDescriptionView()
                .padding(.top, 4)
                .padding(.leading, 12)
        }
    }
    
    @ViewBuilder func failedDescriptionView() -> some View {
        HStack(spacing: .zero) {
            Text(self.description)
                .font(.system(size: 14))
                .foregroundStyle(.gray.opacity(1.0))
                .padding([.leading], 4)
            Spacer()
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct SignUpUploadView_Previews: PreviewProvider {
    struct Container: View {
        var body: some View {
            GeometryReader { proxy in
                VStack {
                    CurrentView(
                        text: Localization.uploadPhoto,
                        buttonAction: { }
                    )
                    .padding()
                    CurrentView(
                        text: Localization.uploadPhoto,
                        description: Localization.photoIsRequired,
                        buttonAction: { },
                        state: .failed
                    )
                    .padding()
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
    
    static var previews: some View {
        Container()
    }
}
#endif
