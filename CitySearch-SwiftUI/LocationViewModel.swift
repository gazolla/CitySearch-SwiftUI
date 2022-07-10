//
//  LocationViewModel.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import Foundation
import MapKit

class LocationViewModel: ObservableObject {
    @Published var locations:[Location] = []
   // @Published var currentLocation:Location = Location()
    
    func searchLocation(text:String){
        let geoCoder = CLGeocoder()
        let location = text
        geoCoder.geocodeAddressString(location) { (placemark, error) in
            if error != nil {
                print(error!)
            }
            if placemark != nil {
                /*self.location*/
                let location = Location(placemark: placemark![0])
                self.locations.append(location)
            }
        }
    }
}
