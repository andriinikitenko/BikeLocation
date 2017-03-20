//
//  CreateNewUserViewController.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 05.03.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit
import Firebase

class CreateNewUserViewController: UIViewController {
    
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction private func createNewUserTouched(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let name = nameTextField.text else {
                print("Form is not valid")
                return
        }
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user:FIRUser?, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)

                print(error)
                return
                
            }
            
            let preferences = UserDefaults.standard
            
            preferences.set(user!.uid, forKey: "UserId")
            
            //  Save to disk
            preferences.synchronize()
            
            
            var ref: FIRDatabaseReference!
            
            ref = FIRDatabase.database().reference().child("users").child(user!.uid)
            let values = ["name": name, "email": email]
            //            ref.setValue(value: Any?)
            
//            ref.setValue(["username": self.nameTextField.text!, "Email": email])
            ref.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    let alert = UIAlertController(title: "Error", message: err?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                print(err)
                return
                }
                
            print ("User saved succesful")
            })
            ref.child("Location").setValue(["Latitude":"","Longitude":""])
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Map", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewController

            
        })
    }
    

    @IBAction private func cancelRegistrationTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
