//
//  LocationManager.swift
//  Murni Discovery
//
//  Created by huaixi on 20/09/2021.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject{
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    static let shared = LocationManager() //shared = LocationManager
    
    @Published var formattedAddress = ""
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    //ask for user location
    func requestLocation(){
        locationManager.requestWhenInUseAuthorization()
    }
}


extension LocationManager: CLLocationManagerDelegate {
    //monitor changes of user location permission status
    //default is undetermined
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //when permission status changes, print to console
        switch status {
        
        case .notDetermined:
            print("Not determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Permission denied")
        case .authorizedAlways:
            print("Always authorize")
        case .authorizedWhenInUse:
            print("Only authorize when in use")
        @unknown default:
            print("Unknown")
            break
        }
    }
    
    //receive user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else{
            return
        }
        self.userLocation = location
        self.getAddressFromLatLon(pdblLatitude: String(self.userLocation!.latitude), withLongitude: String(self.userLocation!.longitude))
    }
    
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let lat: Double = Double("\(pdblLatitude)")!
            let lon: Double = Double("\(pdblLongitude)")!
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = lat
            center.longitude = lon
        
            var addressString : String = ""
            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)

            ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                       
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + ", "
                        }
                        if pm.subAdministrativeArea != nil {
                            addressString = addressString + pm.subAdministrativeArea! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country!
                        }

                        self.formattedAddress = addressString
                  }
            })
        }
    }





