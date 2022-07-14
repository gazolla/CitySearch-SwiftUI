//
//  ContentView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSearchCity: Bool = false
    @ObservedObject private var lvm = LocationViewModel.instance
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(lvm.locations){ city in
                    CityCellView(city: city)
                }
            }
            .navigationTitle("Cities")
            .navigationBarItems(trailing:
                                    Button("Add City") {
                showSearchCity.toggle()
            }
                .sheet(isPresented: $showSearchCity) {
                    SearchCityView(lvm:lvm)
                }
            )
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
