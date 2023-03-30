//
//  LocationManager.swift
//  Weather-DesCode
//
//  Created by Brian McIntosh on 3/29/23.
/*
    1st start by getting user's current location coordinates using CoreLocation framework
    2nd use these to get weather using openweathermap.org, a free API
    Note we can't test location w/ simulator
 */

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? // opt b/c we might not get location permission from user
    @Published var isLoading: Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}

