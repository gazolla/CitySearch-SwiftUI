//
//  ContentView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSearchCity: Bool = false
    
    var body: some View {
        VStack {
            
            Button("Add City") {
                showSearchCity.toggle()
            }
            .sheet(isPresented: $showSearchCity) {
                SearchCityView()
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
