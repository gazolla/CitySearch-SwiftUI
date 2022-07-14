//
//  CityDetailView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 13/07/22.
//

import SwiftUI

struct CityDetailView: View {
    
    @ObservedObject var lvm: LocationViewModel
    
    var body: some View {
        if let location = lvm.currentLocation {
            VStack(){
                CityCellView(city:location)
                Button {
                    lvm.addLocation(location:location)
                } label: {
                    Text("Add City")
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .fontWeight(.medium)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                }
            }
            .padding()
        }
        
    }
}

struct CityCellView:View {
    @State var city: Location
    var body: some View {
        HStack{
                Image(city.flagIconURL ?? "empty")
                    .frame(alignment: .leading)
                VStack(alignment: .leading){
                    Text(city.name ?? "")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment:.leading)
                    Text(city.country ?? "")
                        .fontWeight(.thin)
                }
        }
    }
}

struct PreviewWrapper:View{
    var _lvm: LocationViewModel
    
    init() {
        self._lvm = LocationViewModel.instance
        self._lvm.currentLocation = Location(name:"Brasilia", country:"Brasil", flagIconURL: "BR")
    }
    
    var body: some View {
        CityDetailView(lvm: _lvm)
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
