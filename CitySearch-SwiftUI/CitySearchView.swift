//
//  SearchCityView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import SwiftUI
import MapKit

struct CitySearchView: View {

    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @ObservedObject var cvm: CityViewModel

    var body: some View {
        VStack{
            SearchBar(text: $searchText)
                .padding(.top)
            if let _ = cvm.currentCity {
                CityDetailView(dismissAction: dismissSheet, cvm: cvm)            
            }
            MapView(city: cvm.currentCity ?? City())
                .presentationDetents([ .medium, .large])
        }
        .onDisappear{
            try! cvm.saveCities()
        }
        .onSubmit {
            cvm.searchCity(text: searchText)
        }
        .onChange(of: searchText) { newValue in
           if newValue.isEmpty {
               cvm.searchCity(text: newValue)
           }
        }
    }
    
    private func dismissSheet(){
        dismiss()
    }
}

struct Preview: View {
    var lvm = CityViewModel.instance
    var body: some View {
        CitySearchView(cvm:lvm)
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
