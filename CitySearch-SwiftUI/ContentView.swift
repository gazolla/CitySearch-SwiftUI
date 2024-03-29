//
//  ContentView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert:Bool = false
    @State private var deleteIndexSet: IndexSet?
    @State private var showSearchCity: Bool = false
    @StateObject private var cvm = CityViewModel.instance

    var body: some View {
        NavigationView{
            if cvm.cities.isEmpty {
                CityEmptyListView()
                    .modifier(CityListModifier(showSearchCity: showSearchCity, cvm: cvm))
            } else {
                CityListView(cvm: cvm)
                    .modifier(CityListModifier(showSearchCity: showSearchCity, cvm: cvm))
                    .refreshable {
                        try? cvm.loadCities()
                    }
            }
        }
    }
}

struct CityListModifier: ViewModifier {
    @State var showSearchCity: Bool
    @ObservedObject var cvm:CityViewModel
    func body(content: Content) -> some View {
        content
            .navigationTitle("Cities")
            .navigationBarItems(trailing:
                    Button("Add City") {
                        showSearchCity.toggle()
                    }
                    .sheet(isPresented: $showSearchCity) {
                        CitySearchView(cvm:cvm)
                    })
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
