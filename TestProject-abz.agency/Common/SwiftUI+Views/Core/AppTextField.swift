//
//  AppTextField.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI

//    // MARK: States 🏳️ for what for AppWhiteRoundedRectangle(90%) or for AppTextField(10%)
// If state: .failed - border -> red -> + In textField Text("Not Muched") + Can use "Bool" +-, else .success
//    enum States {
//        case success
//        case failed
//    }

private typealias CurrentView = AppTextField

struct AppTextField: View {
    // MARK: - Public Properties
    let placeholder: String
    let description: String
    let failedDescription: String
    @Binding var text: String
    var state: TextFieldStates
    
    // MARK: Private Properties
    
    // MARK: - Init
    init(
        placeholder: String,
        text: Binding<String>,
        state: TextFieldStates = .default,
        description: String = "",
        failedDescription: String = ""
    ) {
        self.placeholder = placeholder
        self.description = description
        self.failedDescription = failedDescription
        self._text = .init(projectedValue: text)
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
        VStack(spacing: 4) {
            textFieldView()
            failedDescriptionView()
                .padding(8)
        }
    }
    
    @ViewBuilder func textFieldView() -> some View {
        ZStack(alignment: .leading) {
            TextField(
                self.placeholder,
                text: self.$text,
                prompt: Text(self.placeholder)
                    .foregroundStyle(.textBlack)
            )
            .textFieldStyle(
                Style.TextField.WhiteCapsule(
                    state: text.isEmpty
                    ? state 
                    : .focused
                )
            )
            .foregroundStyle(.textBlack)
            
            !text.isEmpty ? subPlaceholder() : nil
        }
    }
    
    @ViewBuilder func failedDescriptionView() -> some View {
        HStack(spacing: .zero) {
            Text(state == .default ? self.description : self.failedDescription)
                .appFontRegularSize12()
                .foregroundStyle(
                    state == .default 
                    ? AppColors.black60.colorSwiftUI
                    : AppColors.errorRedColor.colorSwiftUI
                )
                .padding([.leading], 4)
            Spacer()
        }
    }
    
    @ViewBuilder func subPlaceholder() -> some View {
        Text(self.placeholder)
            .appFontRegularSize12()
            .foregroundStyle(
                text == " "
                ? AppColors.secondaryColor.colorSwiftUI
                : .subTextPrimary
            )
            .padding(.leading)
            .padding(.bottom, 32)
    }
}

// MARK: - Previews
#if !RELEASE
struct AppTextField_Previews: PreviewProvider {
    struct Container: View {
        @State private var phone: String = ""
        @State private var password: String = ""
        
        var body: some View {
            GeometryReader { proxy in
                VStack {
                    CurrentView(
                        placeholder: "Phone",
                        text: $phone,
                        description: "+38 (XXX) XXX - XX - XX"
                    )
                    .padding()
                    CurrentView(
                        placeholder: "Phone",
                        text: $phone,
                        state: .failed,
                        failedDescription: "Required field"
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
