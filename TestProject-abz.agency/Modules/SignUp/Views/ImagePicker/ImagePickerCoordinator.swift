//
//  ImagePickerCoordinator.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 16.09.2024.
//

import UIKit
import SwiftUI

// MARK: - ImagePickerCoordinator
class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // MARK: - Public Properties
    @Binding var selectedImage: UIImage?
    @Binding var isPresented: Bool
    
    // MARK: - Init
    init(
        selectedImage: Binding<UIImage?>,
        isPresented: Binding<Bool>
    ) {
        _selectedImage = selectedImage
        _isPresented = isPresented
    }
    
    // MARK: - Public Methods
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
        }
        isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isPresented = false
    }
}
