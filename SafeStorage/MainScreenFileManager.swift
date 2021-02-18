//
//  MainScreenFileManager.swift
//  SafeStorage
//
//  Created by Андрей on 21.01.2021.
//

import UIKit

extension MainScreenViewController {
    
    func folderManager(_ nameFolder: String) {
        
        do {
            let _ = try fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil)
            let newFolderURL = directoryURL.appendingPathComponent(nameFolder)
            
            try fileManager.createDirectory(at: newFolderURL, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            print(error)
        }
    }
    
    func updateExistingFolders() {
        
        do {
            let contentURL = try fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil)
            
            for allURL in contentURL {
                let objectName = allURL.lastPathComponent
                if objectName.contains(".jpeg") || objectName.contains(".png") {
                    rawData.append(ProfileData(name: objectName, type: .image))
                    imageArray.append(allURL)
                } else {
                    rawData.append(ProfileData(name: objectName, type: .folder))
                }
            }
            
        } catch let error {
            print(error)
        }
    }
    
    func removeFolder(_ nameFolder: String) {
        
        do {
            let _ = try fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil)
            let folderURL = directoryURL.appendingPathComponent(nameFolder)
            try fileManager.removeItem(at: folderURL)
        } catch let error {
            print(error)
        }
    }
    
}
