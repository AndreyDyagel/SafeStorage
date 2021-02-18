//
//  SettingsViewController.swift
//  SafeStorage
//
//  Created by Андрей on 09.02.2021.
//

import UIKit

class SettingsViewController: UIViewController {

 
    @IBOutlet weak var passwordTFOutlet: UITextField!
    @IBOutlet weak var newPasswordTFOutlet: UITextField!
    @IBOutlet weak var confirmPasswordTFOutlet: UITextField!
    @IBOutlet weak var okButtonOutlet: UIButton!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    
    let radius: CGFloat = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        okButtonOutlet.layer.cornerRadius = radius
        saveButtonOutlet.layer.cornerRadius = radius
        
        passwordLabelOutlet.isHidden = true
        newPasswordTFOutlet.isHidden = true
        confirmPasswordTFOutlet.isHidden = true
        saveButtonOutlet.isHidden = true
    }
    
    @IBAction func okActionButton(_ sender: UIButton) {
        enterPassword()
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        changePassword()
    }
    
}
