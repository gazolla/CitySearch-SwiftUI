//
//  LocationViewModel.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import Foundation
import MapKit

class CityViewModel: ObservableObject {
    
    static let instance = CityViewModel()
    
    private init() {
        do{
            try loadCities()
        } catch {
            print("\(error)")
        }
    }
    
    @Published var cities:[City] = []
    @Published var currentCity:City?
    
    func loadCities() throws {
        if let data = UserDefaults.standard.data(forKey: "cities"){
            let decoder = JSONDecoder()
            self.cities = try decoder.decode([City].self, from: data)
            print("loaded")
            print(self.cities)
        }
    }

    func saveCities() throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self.cities.isEmpty ? [City]() : self.cities)
        UserDefaults.standard.set(data, forKey: "cities")
        print(self.cities.isEmpty ? "deleted" : "saved")
    }

    
    func addCity(city:City){
        self.cities.append(city)
    }
    
    func addCity(){
        if let city = currentCity {
            self.cities.append(city)
        } else {
            print("CityViewModel ==>> NO CITY TO ADD")
        }
    }

    func deleteCity( at indexSet: IndexSet){
        cities.remove(atOffsets: indexSet)
    }
    
    func searchCity(text:String){
        guard !text.isEmpty else {
            self.currentCity = nil
            return
        }
        
        let geoCoder = CLGeocoder()
        let location = text
        geoCoder.geocodeAddressString(location) { (placemark, error) in
            if error != nil {
                print(error!)
            }
            if placemark != nil {
                self.currentCity = nil
                self.currentCity = City(placemark: placemark![0])
            } else {
                self.currentCity = nil
            }
        }
    }
}
