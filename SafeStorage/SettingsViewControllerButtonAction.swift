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
            alert(title: "Error", message: "Wrong password!", present: self) { [weak self] in
                guard let self = self else { return }
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
            alert(title: "Error", message: "Password does not match!", present: self) { [weak self] in
                guard let self = self else { return }
                self.newPasswordTFOutlet.text = nil
                self.confirmPasswordTFOutlet.text = nil
            }
        }
    }
    
    func notification() {
        
        let notificationCentre = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.body = "Please, add photo or folder to app!"
        let identifier = "safeStorage"
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: triger)
        
        notificationCentre.add(request, withCompletionHandler: nil)
    }
}
