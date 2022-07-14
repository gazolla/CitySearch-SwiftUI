//
//  SearchCityView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import SwiftUI
import MapKit

struct SearchCityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 51.507222,
            longitude: -0.1275),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5))
    @StateObject var lvm: LocationViewModel
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
                .padding(.top)
            if let _ = lvm.currentLocation {
                CityDetailView(lvm: lvm)
            }
            Map(coordinateRegion:$region)
                .presentationDetents([ .medium, .large])
        }
        .onSubmit {
            lvm.searchLocation(text: searchText)
            print("*********")
            print(lvm.currentLocation!)
            print("********")
            if let city = lvm.currentLocation{
                print("*********")
                print(city)
                print("********")
                self.region = MKCoordinateRegion(
                    center: city.coordinates!,
                    span:MKCoordinateSpan(
                        latitudeDelta: 0.5,
                        longitudeDelta: 0.5))
            }
        }
       .onChange(of: searchText) { newValue in
           if newValue.isEmpty {
               lvm.searchLocation(text: newValue)
           }
        }
    }
}

struct Preview: View {
    var lvm = LocationViewModel.instance
    var body: some View {
        SearchCityView(lvm:lvm)
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
