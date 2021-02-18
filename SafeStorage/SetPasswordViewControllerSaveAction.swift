//
//  SetPasswordViewControllerSaveAction.swift
//  SafeStorage
//
//  Created by Андрей on 11.02.2021.
//

import UIKit

extension SetPasswordViewController {
    
    func enterPassword() {
        let passcoder = PasscoderViewController()
        if enterPasswordTFOutlet.text == confirmPasswordTFOutlet.text {
            guard let text = confirmPasswordTFOutlet.text else { return }
            password = text
            UserDefaults.standard.setValue(password, forKey: "password")
            passcoder.faceId {
                self.dismiss(animated: true, completion: nil)
            }
            dismiss(animated: true, completion: nil)
        } else {
            alert(title: "Error", message: "Password does not match!", present: self) {
                self.enterPasswordTFOutlet.text = nil
                self.confirmPasswordTFOutlet.text = nil
            }
        }
    }
}
