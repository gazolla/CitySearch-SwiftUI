//
//  CityListView.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 27/07/22.
//

import SwiftUI

struct CityListView: View {
    @State private var showAlert:Bool = false
    @State private var deleteIndexSet: IndexSet?
    @StateObject var cvm:CityViewModel 

    var body: some View {
        List{
            ForEach(cvm.cities){ city in
                NavigationLink(destination: CityInfoView(city:city)) {
                    CityCellView(city: city)
                }
             }
            .onDelete(perform: { indexSet in
                self.showAlert = true
                self.deleteIndexSet = indexSet
            })
            .alert(isPresented: $showAlert) {
                let indexSet = self.deleteIndexSet
                return Alert(
                    title: Text("Are you sure?"),
                    primaryButton: .cancel(),
                    secondaryButton: .destructive(Text("Delete"),
                                    action: {
                                        deleteCity(at: indexSet!)
                }))
            }
        }
    }
    
    private func deleteCity(at indexSet: IndexSet){
        withAnimation {
            cvm.deleteCity(at: indexSet)
            try! cvm.saveCities()
        }
    }
}

struct CityListViewWrapper: View{
    @StateObject private var cvm = CityViewModel.instance
    var body: some View {
        NavigationView{
            CityListView(cvm:cvm)
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListViewWrapper()
    }
}
