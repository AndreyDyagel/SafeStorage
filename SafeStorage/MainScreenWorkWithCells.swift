//
//  MainScreenWorkWithCells.swift
//  SafeStorage
//
//  Created by Андрей on 22.01.2021.
//

import UIKit

extension MainScreenViewController {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            guard let type = DataType(rawValue: indexPath.section),
                  let dataForType = dataByType[type] else {
                return
            }
            let dataCell = dataForType[indexPath.row]
            
            removeFolder(dataCell.name)
            rawData.removeAll()
            imageArray.removeAll()
            updateExistingFolders()
            updateData()
        }
    }
    
}
