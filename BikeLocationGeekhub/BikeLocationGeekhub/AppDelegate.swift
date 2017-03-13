//
//  AppDelegate.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 19.02.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit
import CoreData
import GoogleMaps
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        GMSServices.provideAPIKey("AIzaSyClg0xs0U_CpmuULSFrBjUk4zEJuRjRNtM")
        FIRApp.configure()
        if let _ = UserDefaults.standard.value(forKey: "UserId") {
            let storyboard: UIStoryboard = UIStoryboard(name: "Map", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            window?.rootViewController = viewController
        } else {
            let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let viewController = storyboard.instantiateInitialViewController()
            window?.rootViewController = viewController
        }
        window?.makeKeyAndVisible()
        return true
    }

}

