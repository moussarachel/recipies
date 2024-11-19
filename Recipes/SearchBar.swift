//
//  SearchBar.swift
//  Recipes
//
//  Created by Rachel  Moussa  on 11/29/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $searchText)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10.0)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.5),
                        radius: 10, x: 0, y: 0)
        )
        .padding()
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
