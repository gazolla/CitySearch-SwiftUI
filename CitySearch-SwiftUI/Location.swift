//
//  City.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import Foundation
import MapKit

struct Location: Identifiable{
    var id = UUID()
    var name:String?
    var administrativeArea:String?
    var country:String?
    var coordinates:CLLocationCoordinate2D?
    var region:CLRegion?
    var flagIconURL:String?
    
    init(name: String? = nil, administrativeArea: String? = nil, country: String? = nil, coordinates: CLLocationCoordinate2D? = nil, region: CLRegion? = nil, flagIconURL: String? = nil) {
      
        self.name = name
        self.administrativeArea = administrativeArea
        self.country = country
        self.coordinates = coordinates
        self.region = region
        self.flagIconURL = flagIconURL
    }
    
    init(placemark:CLPlacemark){
        self.name = placemark.name
        self.administrativeArea = placemark.administrativeArea
        self.country = placemark.country
        self.coordinates = placemark.location?.coordinate
        self.region = placemark.region
        self.flagIconURL = placemark.isoCountryCode
    }
}
