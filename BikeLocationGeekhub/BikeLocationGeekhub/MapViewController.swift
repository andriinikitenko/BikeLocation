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
    
    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}

// MARK: - CLLocationManagerDelegate
//1
extension MapViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        if status == .authorizedWhenInUse {
            
            // 4
            locationManager.startUpdatingLocation()
            locationManager.location?.coordinate.latitude
            let preferences = UserDefaults.standard
            let userID = preferences.string(forKey: "UserId")
            
            
            var ref: FIRDatabaseReference!
            ref = FIRDatabase.database().reference().child("users").child(userID!)
            ref.child("Location").setValue(["Latitude": locationManager.location?.coordinate.latitude, "Longitude": locationManager.location?.coordinate.longitude])
            
            DispatchQueue.global().async {
                while true {
                    sleep(30)
                    var ref: FIRDatabaseReference!
                    
                    ref = FIRDatabase.database().reference().child("users").child(userID!)
                    ref.child("Location").setValue(["Latitude": self.locationManager.location?.coordinate.latitude, "Longitude": self.locationManager.location?.coordinate.longitude])
                    //It s govnokod but work
                }
            }
            
            //5
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
        }
        
    }
}
