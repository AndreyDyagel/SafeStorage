//
//  PasscoderViewController.swift
//  SafeStorage
//
//  Created by Андрей on 13.02.2021.
//

import UIKit
import LocalAuthentication

class PasscoderViewController: UIViewController {
    
    let content = LAContext()
    let localizedReason = "Please authenticate to proceed"

    func faceId(_ complition: @escaping() -> ()) {
        if content.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            content.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: localizedReason) { [weak self] (success, error) in
                DispatchQueue.main.async {
                    if success {
                        self?.dismiss(animated: true, completion: nil)
                    } else {
                        complition()
                    }
                }
            }
            
        }
    }
}
