//
//  BadgesCollectionView.swift
//  SafeStorage
//
//  Created by Андрей on 27.01.2021.
//

import UIKit

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataByType.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let type = DataType(rawValue: indexPath.section) else {
            return CGSize(width: 50, height: 50)
        }
        
        switch type {
        case .folder:
            return CGSize(width: 85, height: 85)
        case .image:
            return CGSize(width: 130, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let type = DataType(rawValue: section),
              let dataForType = dataByType[type] else {
            return 0
        }
        
        return dataForType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let type = DataType(rawValue: indexPath.section),
              let dataForType = dataByType[type] else {
            return
        }
        let currentData = dataForType[indexPath.item]
        
        if editFolderButtonOutlet.titleLabel?.text == "Edit" {
            
            switch currentData.type {
            case .folder:
                if let folderVC = storyboard?.instantiateViewController(withIdentifier: "MainScreenViewController") as? MainScreenViewController {
                    
                    let checkIfControllerIsOn = false
                    
                    folderVC.directoryURL = directoryURL.appendingPathComponent(currentData.name)
                    folderVC.navigationItem.title = currentData.name
                    folderVC.checkIfControllerIsOn = checkIfControllerIsOn
                    navigationController?.navigationBar.tintColor = .black
                    navigationController?.pushViewController(folderVC, animated: true)
                }
            case .image:

                if let imageVC = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController {
                    imageVC.modalPresentationStyle = .formSheet
                    imageVC.imageArray = imageArray
                    imageVC.indexImage = CGFloat(indexPath.item)
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
                updateData()
            case .image:
                if let folder = selectedFolders.firstIndex(where: { $0.name == currentData.name }) {
                    selectedFolders.remove(at: folder)
                } else {
                    selectedFolders.append(currentData)
                }
                updateData()
            }
        }
        if !selectedFolders.isEmpty {
            removeFoldersOutlet.isEnabled = true
            removeFoldersOutlet.titleLabel?.alpha = 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let type = DataType(rawValue: indexPath.section),
              let dataForType = dataByType[type] else {
            return UICollectionViewCell()
        }
        let currentData = dataForType[indexPath.item]
        
        switch currentData.type {
        case .folder:
            if let folderCell = collectionView.dequeueReusableCell(withReuseIdentifier: FolderCollectionViewCell.identifare, for: indexPath) as? FolderCollectionViewCell {
                
                folderCell.nameFolderCellOutlet.text = currentData.name
                folderCell.isSelected(selectedFolders.contains(where: { $0.name == currentData.name }))
                if checkEditSelected == false {
                    folderCell.checkMarkFolderOutlet.isHidden = false
                } else {
                    folderCell.checkMarkFolderOutlet.isHidden = true
                }
                
                return folderCell
            }
            
        case .image:
            if let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifare, for: indexPath) as? ImageCollectionViewCell {
                
                do {
                    let imageURL = directoryURL.appendingPathComponent(currentData.name)
                    
                    imageCell.imageCellOutlet.image = UIImage(named: imageURL.path)
                }
                
                imageCell.isSelected(selectedFolders.contains(where: { $0.name == currentData.name }))
                if checkEditSelected == false {
                    imageCell.checkMarkImageOutlet.isHidden = false
                } else {
                    imageCell.checkMarkImageOutlet.isHidden = true
                }
                return imageCell
            }
        }
        return UICollectionViewCell()
    }
    
}

