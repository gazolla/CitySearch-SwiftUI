//
//  ContentView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSearchCity: Bool = false
    @StateObject private var cvm = CityViewModel.instance

    var body: some View {
        NavigationView{
            List{
                ForEach(cvm.cities){ city in
                    CityCellView(city: city)
                }
                .onDelete(perform: deleteCity)
            }
            .navigationTitle("Cities")
            .navigationBarItems(trailing:
                    Button("Add City") {
                        showSearchCity.toggle()
                    }
                    .sheet(isPresented: $showSearchCity) {
                        CitySearchView(cvm:cvm)
                    })
            .onChange(of: showSearchCity) { newValue in
                if !newValue {
                    cvm.currentCity = nil
                }
            }
        }
    }
    private func deleteCity(at indexSet: IndexSet){
        cvm.deleteCity(at: indexSet)
        try! cvm.saveCities()
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
