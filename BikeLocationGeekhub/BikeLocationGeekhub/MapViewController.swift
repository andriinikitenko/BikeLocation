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
    let userID = UserDefaults.standard.string(forKey: "UserId")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
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
            userRef.child(userID).child("Location").setValue(["Latitude": locationManager.location?.coordinate.latitude, "Longitude": locationManager.location?.coordinate.longitude])
        }
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

    }
}
