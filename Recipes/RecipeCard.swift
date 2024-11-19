//
//  RecipeCard.swift
//  Recipes
//
//  Created by Rachel  Moussa  on 3/8/23.
//

import SwiftUI

struct RecipeCard: View {
    
//    @State var recipeName: String = ""
//    @State var prepTime: String = ""
//    @State var cookTime: String = ""
//    @State var totaltime: String = ""
//    @State var servings: String = ""
//    @State var ingredientList: [String] = [""]
//    @State var instructions: String = ""
//
    @State var recipeName: String = ""
    @State var totalTime: String = ""
    @State var servings: String = ""
//    @State var details: Card
//    @State var ingredientList: [String] = []

    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .frame(height: UIScreen.main.bounds.height / 6)
                .cornerRadius(30)
                .shadow(color: .gray.opacity(0.5), radius: 5)
            
            VStack (alignment: .leading) {
                Text(recipeName)
                    .font(.headline)
                
                Rectangle()
                    .frame(height: 6)
                    .foregroundColor(.brown.opacity(0.3))
                    .cornerRadius(5)
                
                HStack {
                    Image(systemName: "clock")
                    Text("Total Time: \(totalTime)")
                }
                
                HStack {
                    Image(systemName: "circle.circle")
                    Text("Servings: \(servings)")
                }
            }
            .padding()
            
        }
        .padding()
        
    }
}
//
//struct RecipeCard_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeHeader()
//    }
//}
