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
        let showCamera: () -> Void
        let showGallery: () -> Void
        var state: TextFieldStates
        
        // MARK: Private Properties
        @State private var showAlert = false
        @State private var isImagePickerPresented = false
        @State private var selectedImage: UIImage?
        @State private var imageSource: UIImagePickerController.SourceType = .photoLibrary
        
        // MARK: - Init
        init(
            text: String,
            description: String = "",
            showCamera: @escaping () -> Void,
            showGallery: @escaping () -> Void,
            state: TextFieldStates = .default
        ) {
            self.text = text
            self.description = description
            self.showCamera = showCamera
            self.showGallery = showGallery
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
                    .foregroundStyle(state.color)
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
                                debugPrint(selectedImage ?? .init())
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
    struct Container: View {
        var body: some View {
            GeometryReader { proxy in
                VStack {
                    CurrentView(
                        text: Localization.uploadPhoto,
                        showCamera: { },
                        showGallery: { }
                    )
                    .padding()
                    CurrentView(
                        text: Localization.uploadPhoto,
                        description: Localization.photoIsRequired,
                        showCamera: { },
                        showGallery: { },
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
