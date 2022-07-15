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
    @ObservedObject var lvm: LocationViewModel
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
                .padding(.top)
            if let city = lvm.currentLocation {
                CityDetailView(lvm: lvm)
                MapView(city: city)
                    .presentationDetents([ .medium, .large])
            } else {
                MapView(city: lvm.currentLocation ?? Location())
                    .presentationDetents([ .medium, .large])
            }
        }
        .onSubmit {
            lvm.searchLocation(text: searchText)
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
