//
//  MainScreenPickerVIewController .swift
//  SafeStorage
//
//  Created by Андрей on 22.01.2021.
//

import UIKit

extension MainScreenViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePicker() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage = info[.originalImage] as? UIImage {
            
            do {
                let randomNameImage = Int.random(in: 1...100000)
                let newImageURL = directoryURL.appendingPathComponent("\(randomNameImage).png")
                let pngImage = originalImage.pngData()
                //                let jpegImage = originalImage.jpegData(compressionQuality: 0.5)

                try pngImage?.write(to: newImageURL)
            } catch let error {
                print(error)
            }
        }
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.rawData.removeAll()
            self.imageArray.removeAll()
            self.updateExistingFolders()
            self.updateData()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
