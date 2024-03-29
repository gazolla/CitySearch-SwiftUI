//
//  SearchBar.swift
//  CitySearch-SwiftUI
//
//  Created by sebastiao Gazolla Costa Junior on 11/07/22.
//

import SwiftUI
 
struct SearchBar: View {
    
    enum FocusField: Hashable {
        case field
    }
    
    @Binding var text: String
    @FocusState private var focusedField: FocusField?
    @State private var isEditing = false
 
    var body: some View {
        HStack {
                    
                    TextField("Search ...", text: $text)
                        .focused($focusedField, equals: .field)
                        .task {
                            self.focusedField = .field
                            self.isEditing = true
                          }
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                if isEditing {
                                    Button(action: {
                                        self.text = ""
                                        
                                    }) {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
                            
                            // Dismiss the keyboard
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        //.animation(.default)
                    }
                }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {

        SearchBar(text: .constant(""))
    }
}
