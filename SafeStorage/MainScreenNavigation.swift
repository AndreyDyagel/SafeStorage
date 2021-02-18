//
//  MainScreenNavigation.swift
//  SafeStorage
//
//  Created by Андрей on 09.02.2021.
//

import UIKit

extension MainScreenViewController {
    
    func settingsVC() {
        
        if password == nil {
            let newVC = storyboard?.instantiateViewController(withIdentifier: "SetPasswordViewController") as! SetPasswordViewController
            newVC.modalPresentationStyle = .formSheet
            present(newVC, animated: true, completion: nil)
        } else {
            let newVC = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            newVC.modalPresentationStyle = .formSheet
            present(newVC, animated: true, completion: nil)
        }
    }
}
