//
//  UploadView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 28.08.2024.
//

import SwiftUI
import PhotosUI

private typealias Localization = AppLocale.SignUp
private typealias Module = SignUpModule
private typealias CurrentView = Module.SignUpUploadView

extension Module {
    struct SignUpUploadView: View {
        // MARK: - Public Properties
        let text: String
        let description: String
        @Binding var selectedImage: UIImage?
        var state: TextFieldStates
        
        // MARK: Private Properties
        @State private var showAlert = false
        @State private var isImagePickerPresented = false
        @State private var imageSource: UIImagePickerController.SourceType = .photoLibrary
        
        // MARK: - Init
        init(
            text: String,
            description: String = "",
            selectedImage: Binding<UIImage?>,
            state: TextFieldStates = .default
        ) {
            self.text = text
            self.description = description
            self._selectedImage = selectedImage
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
                    .foregroundStyle(
                        state == .default
                        ? .black48
                        : .errorRed
                    )
                Spacer()
                Button {
                    showAlert = true
                } label: {
                    Text(Localization.upload)
                        .appFontSemiBoldSize16()
                        .foregroundStyle(AppColors.secondaryColor.colorSwiftUI)
                }
                .actionSheet(isPresented: $showAlert) {
                    ActionSheet(
                        title: Text(Localization.Alert.title),
                        buttons: [
                            .default(Text(Localization.Alert.camera)) {
                                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                    imageSource = .camera
                                    isImagePickerPresented = true
                                } else {
                                    print("Camera is not available on this device")
                                }
                            },
                            .default(Text(Localization.Alert.gallery)) {
                                imageSource = .photoLibrary
                                isImagePickerPresented = true
                                debugPrint("\(selectedImage)")
                            },
                            .cancel()
                        ]
                    )
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage, isPresented: $isImagePickerPresented, sourceType: imageSource)
                }
            }
            .frame(height: 56)
            .padding([.trailing, .leading], 16)
            .backgroundWhiteRoundedRectangle(
                state: state == .default
                ? .default
                : .failed
            )
            
            failedDescriptionView()
                .padding(.top, 4)
                .padding(.leading, 12)
        }
    }
    
    @ViewBuilder func failedDescriptionView() -> some View {
        HStack(spacing: .zero) {
            Text(self.description)
                .font(.system(size: 14))
                .foregroundStyle(state.color)
                .padding([.leading], 4)
            Spacer()
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct SignUpUploadView_Previews: PreviewProvider {
    @State static private var image: UIImage? = .launchLogo
    
    struct Container: View {
        var body: some View {
            GeometryReader { proxy in
                VStack {
                    CurrentView(
                        text: Localization.uploadPhoto,
                        selectedImage: $image
                    )
                    .padding()
                    CurrentView(
                        text: Localization.uploadPhoto,
                        description: Localization.photoIsRequired,
                        selectedImage: $image,
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
