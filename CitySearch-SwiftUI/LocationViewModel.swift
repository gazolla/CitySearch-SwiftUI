//
//  LocationViewModel.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import Foundation
import MapKit

class LocationViewModel: ObservableObject {
    
    static let instance = LocationViewModel()
    
    private init(){}
    
    @Published var locations:[Location] = []
    @Published var currentLocation:Location?
    
    func addLocation(location:Location){
        self.locations.append(location)
    }
    
    func searchLocation(text:String){
        
        guard !text.isEmpty else {
            self.currentLocation = nil
            return
        }
        
        let geoCoder = CLGeocoder()
        let location = text
        geoCoder.geocodeAddressString(location) { (placemark, error) in
            if error != nil {
                print(error!)
            }
            if placemark != nil {
                self.currentLocation = nil
                self.currentLocation = Location(placemark: placemark![0])
                print("--------------")
                print(self.currentLocation!)
                print("--------------")
                print(placemark!)
            } else {
                self.currentLocation = nil
            }
        }
    }
}
