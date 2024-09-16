//
//  ImagePicker.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 16.09.2024.
//

import SwiftUI
import UIKit

// MARK: - ImagePicker
struct ImagePicker: UIViewControllerRepresentable {
    // MARK: - Public Properties
    @Binding var selectedImage: UIImage?
    @Binding var isPresented: Bool
    var sourceType: UIImagePickerController.SourceType

    // MARK: - Public Methods
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(selectedImage: $selectedImage, isPresented: $isPresented)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //
    }
}
