//
//  MainScreenRegisterCellXib.swift
//  SafeStorage
//
//  Created by Андрей on 27.01.2021.
//

import UIKit

extension MainScreenViewController {
    
    func register() {
        
        tableViewOutlet.register(UINib(nibName: "FolderTableViewCell", bundle: nil), forCellReuseIdentifier: FolderTableViewCell.identifare)
        tableViewOutlet.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: ImageTableViewCell.identifare)
        
        collectionViewOutlet.register(UINib(nibName: "FolderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FolderCollectionViewCell.identifare)
        collectionViewOutlet.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifare)
    }
}
