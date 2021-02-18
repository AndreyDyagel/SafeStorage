//
//  MainScreenUpdateData.swift
//  SafeStorage
//
//  Created by Андрей on 27.01.2021.
//

import UIKit

extension MainScreenViewController {
    
    func updateData() {
        
        dataByType[.folder] = rawData.filter({ $0.type == .folder })
        dataByType[.image] = rawData.filter({ $0.type == .image })
        tableViewOutlet.reloadData()
        collectionViewOutlet.reloadData()
    }
}
