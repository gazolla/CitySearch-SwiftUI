//
//  SearchCityView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 10/07/22.
//

import SwiftUI

struct SearchCityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
                .padding(.top)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .presentationDetents([ .medium, .large])
        }
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCityView()
    }
}
