//
//  ContentView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSearchCity: Bool = false
    @StateObject private var lvm = CityViewModel.instance

    var body: some View {
        NavigationView{
            List{
                ForEach(lvm.cities){ city in
                    CityCellView(city: city)
                }
            }
            .navigationTitle("Cities")
            .navigationBarItems(trailing:
                    Button("Add City") {
                        showSearchCity.toggle()
                    }
                    .sheet(isPresented: $showSearchCity) {
                        CitySearchView(cvm:lvm)
                    })
            .onChange(of: showSearchCity) { newValue in
                if !newValue {
                    lvm.currentCity = nil
                }
            }
        }
    }
}

// MARK: Small Custom Detent
extension PresentationDetent{
    static let small = Self.height(100)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
