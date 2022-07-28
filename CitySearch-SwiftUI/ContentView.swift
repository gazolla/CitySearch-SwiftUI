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
    @ObservedObject private var cvm = CityViewModel.instance

    var body: some View {
        NavigationView{
            if cvm.cities.isEmpty {
                CityEmptyListView()
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
            } else {
                CityListView()
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
