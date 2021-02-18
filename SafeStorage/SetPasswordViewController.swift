//
//  SetPasswordViewController.swift
//  SafeStorage
//
//  Created by Андрей on 11.02.2021.
//

import UIKit

class SetPasswordViewController: UIViewController {

    @IBOutlet weak var enterPasswordTFOutlet: UITextField!
    @IBOutlet weak var confirmPasswordTFOutlet: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    let radius: CGFloat = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButtonOutlet.layer.cornerRadius = radius
    }

    @IBAction func saveButtonAction(_ sender: UIButton) {
        enterPassword()
    }
    
}
