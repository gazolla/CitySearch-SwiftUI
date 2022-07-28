//
//  CityDetailView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 13/07/22.
//

import SwiftUI

struct CityDetailView: View {
    
    var dismissAction: (()->())?
    @ObservedObject var cvm: CityViewModel
    
    var body: some View {
        if let city = cvm.currentCity {
            VStack(){
                CityCellView(city:city)
                Button {
                    cvm.addCity(location:city)
                    dismissAction!()
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
    @State var city: City
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
    var _lvm: CityViewModel
    init() {
        self._lvm = CityViewModel.instance
        self._lvm.currentCity = City(name:"Brasilia", country:"Brasil", flagIconURL: "BR")
    }
    var body: some View {
        CityDetailView(cvm: _lvm)
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
