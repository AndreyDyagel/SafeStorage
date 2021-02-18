//
//  SceneDelegate.swift
//  SafeStorage
//
//  Created by Андрей on 17.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {

        let passcodeVC = PasscoderViewController(nibName: "PasscoderViewController", bundle: nil)
        
        if password == nil {
            let alert = UIAlertController(title: nil,
                                          message: "Want to set a password?",
                                          preferredStyle: .alert)
            var alertTextField: UITextField!
            let okAction = UIAlertAction(title: "OK",
                                         style: .default) { _ in
                if alertTextField.text == "" {
                    self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                } else {
                    guard let text = alertTextField.text else { return }
                    password = text
                    UserDefaults.standard.setValue(password, forKey: "password")
                    passcodeVC.faceId {
                        print("Ok")
                    }
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .default,
                                             handler: nil)
            cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            alert.addTextField { textField in
                alertTextField = textField
                alertTextField.keyboardType = .numberPad
                alertTextField.textAlignment = .center
                alertTextField.isSecureTextEntry = true
            }
            window?.rootViewController?.present(alert, animated: true, completion: nil)
            
        } else {
            
            passcodeVC.modalPresentationStyle = .overFullScreen
            self.window?.rootViewController?.present(passcodeVC, animated: false, completion: nil)

            passcodeVC.faceId {
                let alert = UIAlertController(title: "Please!",
                                              message: "Enter your password!",
                                              preferredStyle: .alert)
                var alertTextField: UITextField!
                let okAction = UIAlertAction(title: "OK",
                                             style: .default) { _ in
                    guard let text = alertTextField.text else { return }
                    if text != password {
                        alertTextField.text = ""
                        passcodeVC.present(alert, animated: true, completion: nil)
                    } else {
                        passcodeVC.dismiss(animated: true, completion: nil)
                    }
                }
                alert.addAction(okAction)
                alert.addTextField { textField in
                    alertTextField = textField
                    alertTextField.keyboardType = .numberPad
                    alertTextField.textAlignment = .center
                    alertTextField.isSecureTextEntry = true
                }
                passcodeVC.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
}
