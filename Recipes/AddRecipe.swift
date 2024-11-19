//
//  AddRecipe.swift
//  Recipes
//
//  Created by Rachel  Moussa  on 12/7/22.
//

import SwiftUI

class Ingredient: Equatable{
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.item == rhs.item
    }
    
    let id = UUID()
    var item: String
    
    init( _ item: String){
        self.item = item
    }
}

class Card: Equatable {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.ingredientList == rhs.ingredientList
    }
    
    let id = UUID()
    var recipeName: String
    var prepTime: String
    var totalTime: String
    var cookTime: String
    var servings: String
    var ingredientList: [Ingredient]
    var instructions: String
    
    init(recipeName: String, prepTime: String, totalTime: String, cookTime: String, servings: String, ingredientList: [Ingredient], instructions: String){
        self.recipeName = recipeName
        self.prepTime = prepTime
        self.totalTime = totalTime
        self.cookTime = cookTime
        self.servings = servings
        self.ingredientList = ingredientList
        self.instructions = instructions
    }
    
}

struct AddRecipe: View {
    
    @Environment(\.presentationMode) var presentationMode
    
//    @EnvironmentObject var cardInfo: Card
    
    @State var recipeName: String = ""
    @State var prepTime: String = ""
    @State var cookTime: String = ""
    @State var totalTime: String = ""
    @State var servings: String = ""
    @State var ingredientList: [Ingredient] = [Ingredient("")]
    @State var instructions: String = ""
//    @State var newCard: [Card]
    @Binding var newCard: [Card]
    @State var hasDetails: Bool = false

    var body: some View {
        
        ScrollView { //Start: background layer
            
//            Color.brown.opacity(0.1).ignoresSafeArea()
            
            VStack (alignment: .leading) {
                
                Text("Create New Recipe")
                    .font(.largeTitle)
                    .bold()
                
                Rectangle()
                    .frame(height: 250)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .shadow(color: .gray.opacity(0.5), radius: 5)
                    .overlay(
                        Details(recipeName: $recipeName, prepTime: $prepTime, cookTime: $cookTime, totalTime: $totalTime, servings: $servings)
                            .padding()
                    )
                
                Text("Ingredients")
                    .font(.title2)
                    .padding()
//                List {
                
                    ForEach($ingredientList, id: \.self.id) { $value in
                        VStack {
                            HStack {
                                Image(systemName: "square")
                                TextField("", text: $value.item)
                            }
                            Divider()
                        }
                    }
                    
//                }
                
                Button {
                    ingredientList.append(Ingredient(""))
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.brown)
                }
                
                Text("Instructions")
                    .font(.title2)
                    .padding()
                
                TextEditor(text: $instructions)
                    .frame(height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                    newCard.append(Card(recipeName: recipeName, prepTime: prepTime, totalTime: totalTime, cookTime: cookTime, servings: servings, ingredientList: ingredientList, instructions: instructions))
                } label: {
                    Text("Done")
                }
                .disabled(recipeName == "" || totalTime == "" || servings == "")
                
            }
            .padding()
            
        } //End: Background Layer
        
    }
    
}

//struct AddRecipe_Previews: PreviewProvider {
//
////    var newCard: [Card] = [Card(recipeName: "", prepTime: "", totalTime: "", cookTime: "", servings: "", ingredientList: [Ingredient("")], instructions: "")]
//
//    static var previews: some View {
////        AddRecipe(newCard: newCard)
//    }
//}

struct Details: View {
    
    @Binding var recipeName: String
    @Binding var prepTime: String
    @Binding var cookTime: String
    @Binding var totalTime: String
    @Binding var servings: String
    
    var body: some View {
        
        VStack {
        
            HStack {
                Text("Recipe Title*")
                    .font(.headline)
                TextField("", text: $recipeName)
                    .frame(maxWidth: .infinity)
                    .textFieldStyle(.roundedBorder)
            }
            
            Rectangle()
                .frame(height: 6)
                .foregroundColor(.brown.opacity(0.3))
                .cornerRadius(5)
            
            HStack {
                Image(systemName: "clock")
                Text("Prep Time:")
                TextField("e.g. 1 hour", text: $prepTime)
                    .frame(maxWidth: .infinity)
            }
            
            HStack {
                Image(systemName: "clock")
                Text("Cook Time:")
                TextField("", text: $cookTime)
                    .frame(maxWidth: .infinity)
            }
            
            HStack {
                Image(systemName: "clock")
                Text("Total Time*:")
                TextField("", text: $totalTime)
                    .frame(maxWidth: .infinity)
            }
            
            HStack {
                Image(systemName: "circle.circle")
                Text("Servings*:")
                TextField("", text: $servings)
                    .frame(maxWidth: .infinity)
            }
         
        }
        
    }
}
