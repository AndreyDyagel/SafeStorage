//
//  Alert.swift
//  SafeStorage
//
//  Created by Андрей on 10.02.2021.
//

import UIKit

func alert(title: String?, message: String?, present: UIViewController, complition: @escaping() -> ()) {
    
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK",
                                 style: .default) { (_) in
        complition()
    }
    alert.addAction(okAction)
    present.present(alert, animated: true, completion: nil)
}
