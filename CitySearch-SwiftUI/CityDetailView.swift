//
//  CityDetailView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 13/07/22.
//

import SwiftUI

struct CityDetailView: View {
    
    @StateObject var lvm: LocationViewModel
    

    var body: some View {
        VStack(){
            HStack{
                Image(lvm.currentLocation!.flagIconURL!)
                    .frame(alignment: .leading)
                VStack(alignment: .leading){
                    Text(lvm.currentLocation!.name!)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment:.leading)
                    Text(lvm.currentLocation!.country!)
                        .fontWeight(.thin)
                }
            }
            
            Button {
                
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
