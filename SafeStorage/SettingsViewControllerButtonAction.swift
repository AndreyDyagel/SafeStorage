//
//  SettingsViewControllerButtonAction.swift
//  SafeStorage
//
//  Created by Андрей on 10.02.2021.
//

import UIKit

extension SettingsViewController {
    
    func enterPassword() {
        if passwordTFOutlet.text == password {
            passwordLabelOutlet.isHidden = false
            newPasswordTFOutlet.isHidden = false
            confirmPasswordTFOutlet.isHidden = false
            saveButtonOutlet.isHidden = false
            passwordTFOutlet.isEnabled = false
            okButtonOutlet.isHidden = true
        } else {
            alert(title: "Error", message: "Wrong password!", present: self) {
                self.passwordTFOutlet.text = nil
            }
        }
    }
    
    func changePassword() {
        if newPasswordTFOutlet.text == confirmPasswordTFOutlet.text {
            guard let text = confirmPasswordTFOutlet.text else { return }
            password = text
            UserDefaults.standard.setValue(password, forKey: "password")
            dismiss(animated: true, completion: nil)
        } else {
            alert(title: "Error", message: "Password does not match!", present: self) {
                self.newPasswordTFOutlet.text = nil
                self.confirmPasswordTFOutlet.text = nil
            }
        }
    }
}
