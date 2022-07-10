//
//  City.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import Foundation
import MapKit

struct Location: Identifiable{
    var id:String?
    var name:String?
    var administrativeArea:String?
    var country:String?
    var coordinates:CLLocationCoordinate2D?
    var region:CLRegion?
    var flagIconURL:String?

    init(placemark:CLPlacemark){
       // self.init()
        self.name = placemark.name
        self.administrativeArea = placemark.administrativeArea
        self.country = placemark.country
        self.coordinates = placemark.location?.coordinate
        self.region = placemark.region
        self.flagIconURL = placemark.isoCountryCode
    }
    
    init(attrib:[String:AnyObject]){
        //self.init()
        if let id = attrib["id"] as? String { self.id = id }
        if let name = attrib["name"] as? String { self.name = name }
        if let location = attrib["location"]{
            if let state = location["state"] as? String { self.administrativeArea = state }
            if let country = location["country"] as? String { self.country = country }
          //  if let coordinates = placemark.location?.coordinate { self.coordinates = coordinates }
        }
    }

}
