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
            passcoder.faceId { [weak self] in
                guard let self = self else { return }
                self.dismiss(animated: true, completion: nil)
            }
            dismiss(animated: true, completion: nil)
        } else {
            alert(title: "Error", message: "Password does not match!", present: self) { [weak self] in
                guard let self = self else { return }
                self.enterPasswordTFOutlet.text = nil
                self.confirmPasswordTFOutlet.text = nil
            }
        }
    }
}
