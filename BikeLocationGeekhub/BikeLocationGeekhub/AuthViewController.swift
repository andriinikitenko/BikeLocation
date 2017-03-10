//
//  AuthViewController.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 05.03.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {
    
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var emailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 192, g: 192, b: 192)
        //        if FIRAuth.auth()?.currentUser?.uid == nil {
        //        perform(#selector(handleLogout), with: nil, afterDelay: 0)
        //        handleLogout()
        //    }
        //        //        }
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        //            }
        //
        //
        //        func handleLogout() {
        //            do {
        //                try FIRAuth.auth()?.signOut()
        //            } catch let logoutError {
        //            print(logout)
        //            }
        //            }
        //            let loginController = AuthViewController()
        ////        present(loginController, animated:true, completion: nil)//  Func for logout
    }
    
    @IBAction private func loginTouched(_ sender: UIButton) {
        guard let email = emailTextfield.text, let password = passwordTextfield.text
            else {
                print("Form is not valid")
                return
        }
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print(error)
                return
                // Authenication sucessfuly by user
                
                //                func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
                //                    if (status == CLAuthorizationStatus.Denied) {
                //                        // The user denied authorization
                //                    } else if (status == CLAuthorizationStatus.AuthorizedAlways) {
                //                        // The user accepted authorization
                //                    }
                //                }
            }
            
            let preferences = UserDefaults.standard
            
            
            preferences.set(user!.uid, forKey: "UserId")
            
            //  Save to disk
            preferences.synchronize()
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Map", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewController
        })
    }
    
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1 )
    }
}

