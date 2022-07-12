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
    @StateObject private var lvm = LocationViewModel()
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
                .padding(.top)
            Map(coordinateRegion: $region)
            
                .presentationDetents([ .medium, .large])
        }
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCityView()
    }
}
