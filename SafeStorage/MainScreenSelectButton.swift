//
//  MainScreenSelectButton.swift
//  SafeStorage
//
//  Created by Андрей on 27.01.2021.
//

import UIKit

extension MainScreenViewController {
    
    func selectedButton(_ bool: Bool) {
        if bool == true {
            listOutlet.isSelected = true
            listOutlet.backgroundColor = .clear
            badgesOutlet.isSelected = false
            badgesOutlet.backgroundColor = .white
            tableViewOutlet.isHidden = false
            collectionViewOutlet.isHidden = true
        } else {
            listOutlet.isSelected = false
            listOutlet.backgroundColor = .white
            badgesOutlet.isSelected = true
            badgesOutlet.backgroundColor = .clear
            tableViewOutlet.isHidden = true
            collectionViewOutlet.isHidden = false
        }
    }

}
