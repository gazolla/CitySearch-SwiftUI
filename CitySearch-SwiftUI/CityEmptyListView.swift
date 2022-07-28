//
//  CityEmptyListView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 27/07/22.
//

import SwiftUI

struct CityEmptyListView: View {
    
    @State private var animate:Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                
                Image("City")
                    .padding()
                Text ("There are no Cities!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("You should click the add button and add a bunch of cities to your list!")
                
                    .multilineTextAlignment(.center)
                    .padding(40)
            }
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
    }
}

struct CityEmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        CityEmptyListView()
    }
}
