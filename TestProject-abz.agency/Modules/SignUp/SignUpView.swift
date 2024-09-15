//
//  SignUpView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import SwiftUI
import PhotosUI

private typealias Localization = AppLocale.SignUp
private typealias Module = SignUpModule
private typealias ModuleView = Module.MainView

// MARK: - MainView
extension Module {
    struct MainView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator

        // MARK: - Public Properties
        @State var nameState: TextFieldStates = .default
        @State var emailState: TextFieldStates = .default
        @State var phoneState: TextFieldStates = .default
        @State var photoState: TextFieldStates = .default
        
        // MARK: - Private Properties
        @State private var name: String = ""
        @State private var email: String = ""
        @State private var phone: String = ""
        @State private var positionId: Int = 1

        // MARK: - Body
        var body: some View {
            content()
                .padding(.top)
                .padding([.leading, .trailing], 16)
            .onAppear {
                self.viewModel.onAppear()
            }
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func content() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 12) {
                VStack(spacing: 24) {
                    Module.FormView(
                        name: $name,
                        email: $email,
                        phone: $phone,
                        nameState: nameState,
                        emailState: emailState,
                        phoneState: phoneState
                    )
                    .padding(.top, 32)
                    positionView()
                }
                Spacer()
                VStack(spacing: 18) {
                    Module.SignUpUploadView(
                        text: Localization.uploadPhoto,
                        buttonAction: {},
                        state: photoState
                    )
                    AppCapsuleButton(
                        label: Localization.buttonText,
                        state: email.isEmpty ? .disabled : .normal,
                        action: didTapNextButton
                    )
                    .padding(.bottom, 24)
                }
            }
        }
        
    }
    
    @ViewBuilder func positionView() -> some View {
        VStack(alignment: .leading) {
            Text(Localization.selectPosition)
                .appFontRegularSize18()
            Module.ListView(
                localizations: viewModel.positionModels.map { $0.name },
                selectedIndex: { index in
                    positionId = index + 1
                    debugPrint("\(index)")
                }
            )
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
    func didTapNextButton() {
        guard name.count >= 2 else { return nameState = .failed }
        nameState = .focused
        
        guard viewModel.isValidEmail(email) else { return emailState = .failed }
        emailState = .focused
        
        guard phone.hasPrefix("+380") else { return phoneState = .failed }
        phoneState = .focused
        
//        guard let photo = photo,
//              let imageData = photo.jpegData(compressionQuality: 1.0),
//              imageData.count <= 5 * 1024 * 1024,  // Не больше 5MB
//              let image = UIImage(data: imageData),
//              image.size.width >= 70 && image.size.height >= 70 else {
//            photoState = .failed
//            return
//        }
//        photoState = .focused
        
        Task {
            try await self.viewModel.didTapRegister(
                name: name,
                email: email,
                phone: phone,
                positionId: positionId,
                photo: ""
            )
            self.navigator.push(.signUpSuccess)
        } catchInMain: { error in
            AppLog.error(error.localizedDescription)
            self.navigator.push(.signUpFailed)
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpModule().assemble()
            .previewDevice(.iPhone15Pro)
        SignUpModule().assemble()
            .previewDevice(.iPhoneSE_3rd)
    }
}
#endif
