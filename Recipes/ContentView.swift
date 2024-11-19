//
//  ContentView.swift
//  Recipes
//
//  Created by Rachel  Moussa  on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText: String = ""
    @State var isPresented: Bool = false
    @State private var selectedItem = 1
    @State private var prevSelectedItem = 1
    
    @State var newCard: [Card] = []

    var body: some View {
        
        VStack {
            
            TabView (selection: $selectedItem) {
                
                HomePage(newCard: $newCard)
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(1)
                
                Text("")
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                    }.tag(2)
                
                Text("Favorites")
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                
            }
            .onChange(of: selectedItem) { newValue in
                if newValue == 2 {
                    isPresented = true
                    selectedItem = prevSelectedItem
                } else {
                    prevSelectedItem = newValue
                }
            }
        }
        .sheet(isPresented: $isPresented) {
//            AddRecipe(newCard: newCard)
            AddRecipe(newCard: $newCard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
