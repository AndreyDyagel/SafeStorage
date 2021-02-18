//
//  MainScreen + TableView.swift
//  SafeStorage
//
//  Created by Андрей on 26.01.2021.
//

import UIKit

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataByType.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let type = DataType(rawValue: section),
              let dataForType = dataByType[type] else {
            return 0
        }
        
        return dataForType.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let type = DataType(rawValue: indexPath.section) else {
            return 40
        }
        switch type {
        case .folder:
            return 60
        case .image:
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let type = DataType(rawValue: indexPath.section),
              let dataForType = dataByType[type] else {
            return
        }
        
        let currentData = dataForType[indexPath.row]
        
        if editFolderButtonOutlet.titleLabel?.text == "Edit" {
            
            switch currentData.type {
            case .folder:
                if let newFolderVC = storyboard?.instantiateViewController(withIdentifier: "MainScreenViewController") as? MainScreenViewController {
                    
                    newFolderVC.directoryURL = directoryURL.appendingPathComponent(currentData.name)
                    newFolderVC.navigationItem.title = currentData.name
                    navigationController?.navigationBar.tintColor = .black
                    navigationController?.pushViewController(newFolderVC, animated: true)
                }
            case .image:
                if let imageVC = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController {
                    imageVC.modalPresentationStyle = .formSheet
                    imageVC.imageArray = imageArray
                    imageVC.indexImage = CGFloat(indexPath.row)
                    present(imageVC, animated: true, completion: nil)
                }
            }
        } else {
            
            switch currentData.type {
            case .folder:
                if let folder = selectedFolders.firstIndex(where: { $0.name == currentData.name }) {
                    selectedFolders.remove(at: folder)
                } else {
                    selectedFolders.append(currentData)
                }
            case .image:
                if let image = selectedFolders.firstIndex(where: { $0.name == currentData.name }) {
                    selectedFolders.remove(at: image)
                } else {
                    selectedFolders.append(currentData)
                }
            }
        }
        
        if !selectedFolders.isEmpty {
            removeFoldersOutlet.isEnabled = true
            removeFoldersOutlet.titleLabel?.alpha = 1
        } 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let type = DataType(rawValue: indexPath.section),
              let dataForType = dataByType[type] else {
            return UITableViewCell()
        }
        let currentData = dataForType[indexPath.row]
        
        switch currentData.type {
        case .folder:
            if let folderCell = tableView.dequeueReusableCell(withIdentifier: FolderTableViewCell.identifare, for: indexPath) as? FolderTableViewCell {
                folderCell.nameFolderOutlet.text = currentData.name
                
                return folderCell
            }
        case .image:
            if let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifare, for: indexPath) as? ImageTableViewCell {
                do {
                    let imageURL = directoryURL.appendingPathComponent(currentData.name)
                    imageCell.imageCellOutlet.image = UIImage(named: imageURL.path)
                    imageCell.imageNameCellOutlet.text = currentData.name
                }
                
                return imageCell
            }
        }
        
        return UITableViewCell()
    }
    
}
