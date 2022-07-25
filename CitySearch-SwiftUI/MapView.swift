//
//  MapView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 14/07/22.
//

import SwiftUI
import MapKit

struct MapView: View {
   
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 51.507222,
            longitude: -0.1275),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))
    
    @State var city: City
    
    var body: some View {
        Map(coordinateRegion:$region)
            .onAppear{
                if let coord = city.coordinates {
                    self.region = MKCoordinateRegion(
                                        center: coord,
                                        span:MKCoordinateSpan(
                                            latitudeDelta: 0.5,
                                            longitudeDelta: 0.5))
                } 
            }
    }
    
}

struct MapPreviewWrapper:View {
    var _lvm: CityViewModel
    init() {
        self._lvm = CityViewModel.instance
        self._lvm.currentCity = City(name:"Brasilia", country:"Brasil", flagIconURL: "BR")
    }
    var body: some View {
        MapView(city: _lvm.currentCity!)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapPreviewWrapper()
    }
}
