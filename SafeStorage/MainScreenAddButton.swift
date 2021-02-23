//
//  MainScreenAddButton.swift
//  SafeStorage
//
//  Created by Андрей on 18.01.2021.
//

import UIKit

extension MainScreenViewController {
    
    func actionSheet() {
        let alertSheet = UIAlertController(title: nil,
                                           message: nil,
                                           preferredStyle: .actionSheet)
        let addPhoto = UIAlertAction(title: "add photo",
                                     style: .default) { [weak self] (_) in
            guard let self = self else { return }
            self.imagePicker()
        }
        let addFolder = UIAlertAction(title: "add folder",
                                      style: .default) { [weak self] (_) in
            guard let self = self else { return }
            self.alert(title: "New Folder", message: "Please enter folder name!") { (string) in
                self.rawData.append(ProfileData(name: string, type: .folder))
                self.updateData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel",
                                   style: .cancel) { [weak self] (_) in
            guard let self = self else { return }
            self.dismiss(animated: true, completion: nil)
        }
        cancel.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertSheet.addAction(addPhoto)
        alertSheet.addAction(addFolder)
        alertSheet.addAction(cancel)
        
        present(alertSheet, animated: true, completion: nil)
    }
    
    
    func alert(title: String, message: String, with complition: @escaping (String)->()) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        var alertTextField: UITextField!
        let okAction = UIAlertAction(title: "Save",
                                     style: .default) { [weak self] _ in
            guard let self = self else { return }
            guard let text = alertTextField.text else { return }
            let newFolderName = Int.random(in: 0...10000)
            if text.isEmpty {
                complition("\(newFolderName) folder")
                //                self.tableView.reloadRows(at: [IndexPath(row: self.data.count - 1, section: 0)], with: .fade)
                self.folderManager("\(newFolderName) folder")
            } else {
                complition(text)
                //                self.tableView.reloadRows(at: [IndexPath(row: self.data.count - 1, section: 0)], with: .fade)
                self.folderManager(text)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .destructive,
                                         handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        alertController.addTextField { (string) in
            alertTextField = string
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func removeSelected() {
        
        let alert = UIAlertController(title: "Attention!",
                                      message: "Delete files permanently?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { [weak self] _ in
            guard let self = self else { return }
            for object in self.selectedFolders {
                do {
                    try self.fileManager.removeItem(at: self.directoryURL.appendingPathComponent(object.name))
                    self.rawData.removeAll(where: { $0.name == object.name })
                    self.imageArray.removeAll(where: {$0.lastPathComponent == object.name })
                    self.dataByType.updateValue(self.rawData, forKey: object.type)
                } catch let error {
                    print(error)
                }
            }
            self.updateData()
            self.removeFoldersOutlet.isEnabled = false
            self.removeFoldersOutlet.titleLabel?.alpha = 0.5
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .destructive) { [weak self] _ in
            guard let self = self else { return }
            self.removeFoldersOutlet.isEnabled = false
            self.removeFoldersOutlet.titleLabel?.alpha = 0.5
            self.selectedFolders = []
            self.updateData()
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}
