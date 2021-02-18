//
//  MainScreenButtonSetting.swift
//  SafeStorage
//
//  Created by Андрей on 03.02.2021.
//

import UIKit

extension MainScreenViewController {
    
    func editButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "Edit" {
            sender.setTitle("Done", for: .normal)
            checkEditSelected = false
            removeFoldersOutlet.isHidden = false
            removeFoldersOutlet.isEnabled = false
            removeFoldersOutlet.titleLabel?.alpha = 0.5
            tableViewOutlet.allowsMultipleSelection = true
            collectionViewOutlet.allowsMultipleSelection = true
            stackViewOutlet.isHidden = true
            newFolderOutlet.isEnabled = false
            settingsButtonOutlet.isHidden = true
        } else {
            sender.setTitle("Edit", for: .normal)
            checkEditSelected = true
            removeFoldersOutlet.isHidden = true
            tableViewOutlet.allowsMultipleSelection = false
            collectionViewOutlet.allowsMultipleSelection = false
            stackViewOutlet.isHidden = false
            newFolderOutlet.isEnabled = true
            settingsButtonOutlet.isHidden = false
            selectedFolders = []
        }
        updateData()
    }
}
