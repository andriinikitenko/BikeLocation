//
//  MapViewController.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 19.02.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase
class MapViewController: UIViewController {
    
    @IBOutlet weak var locationSwitcher: UISwitch!
    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    var userID: String? = UserDefaults.standard.string(forKey: "UserId")
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        if revealViewController() != nil {
                        revealViewController().rearViewRevealWidth = 200
            sideMenuButton.target = revealViewController()
            sideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            revealViewController().rightViewRevealWidth = 150
//            extraButton.target = revealViewController()
//            extraButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        }
    }
}

// MARK: - CLLocationManagerDelegate
//1
extension MapViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    }
    
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        if locationSwitcher.isOn {
            print("SAVED")
            
            if let userId = userID {
                userRef.child(userId).child("Location").setValue(["Latitude": locationManager.location?.coordinate.latitude, "Longitude": locationManager.location?.coordinate.longitude])
            }
        }
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

    }
}
