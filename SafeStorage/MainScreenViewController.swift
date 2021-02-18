//
//  MainScreenViewController.swift
//  SafeStorage
//
//  Created by Андрей on 26.01.2021.
//

import UIKit

var password = UserDefaults.standard.string(forKey: "password")

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var listOutlet: UIButton!
    @IBOutlet weak var badgesOutlet: UIButton!
    @IBOutlet weak var editFolderButtonOutlet: UIButton!
    @IBOutlet weak var stackViewOutlet: UIStackView!
    @IBOutlet weak var removeFoldersOutlet: UIButton!
    @IBOutlet weak var newFolderOutlet: UIBarButtonItem!
    @IBOutlet weak var settingsButtonOutlet: UIButton!
    
    let fileManager = FileManager.default
    let radius: CGFloat = 10
    var checkIfControllerIsOn = true
    var checkEditSelected = true
    var rawData: [ProfileData] = []
    var dataByType: [DataType : [ProfileData]] = [:]
    var selectedFolders: [ProfileData] = []
    var directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var imageArray: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stackViewOutlet.layer.cornerRadius = radius
        removeFoldersOutlet.isHidden = true
        
        register()
        updateExistingFolders()
        tableViewOutlet.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        if checkIfControllerIsOn == true {
            selectedButton(true)
        } else {
            selectedButton(false)
        }
        
        updateData()
        collectionViewOutlet.reloadData()
    }

    @IBAction func newFolder(_ sender: UIBarButtonItem) {
        
        actionSheet()
    }
    
    @IBAction func buttonsActions(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
           selectedButton(true)
            checkIfControllerIsOn = true
        case 1:
            selectedButton(false)
            checkIfControllerIsOn = false
        default:
            break
        }
    }
    
    @IBAction func editButtonAction(_ sender: UIButton) {
        editButton(sender)
    }
    
    @IBAction func deleteSelectedFolderButtonAction(_ sender: UIButton) {
        if !selectedFolders.isEmpty {
            removeSelected()
        }
    }
    
    @IBAction func settingsButtonAction(_ sender: UIButton) {
        settingsVC()
    }
    
}
