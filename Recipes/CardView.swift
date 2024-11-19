//
//  CardView.swift
//  Recipes
//
//  Created by Rachel  Moussa  on 3/8/23.
//

import SwiftUI

struct CardView: View {

//    @State var recipeName: String = ""
//    @State var prepTime: String = ""
//    @State var cookTime: String = ""
//    @State var totaltime: String = ""
//    @State var servings: String = ""
//    @State var ingredientList: [String] = [""]
//    @State var instructions: String = ""

    @State var recipeName: String = "Cupcakes"
    @State var prepTime: String = "p"
    @State var cookTime: String = "c"
    @State var totalTime: String = "t"
    @State var servings: String = "s"
    @State var ingredientList: [String] = ["il"]
    @State var instructions: String = "i"
    
    @State var hasIngredient: Bool = false
    
    var body: some View {
        
        VStack {
            
            Text(recipeName)
                .font(.largeTitle)
                .bold()
            ZStack {
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: UIScreen.main.bounds.height / 6)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.5), radius: 5)
                
                VStack {
                    HStack {
                        Image(systemName: "clock")
                        Text("Prep Time: \(prepTime)")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                        Text("Cook Time: \(cookTime)")
                    }
                    
                    HStack {
                        Image(systemName: "clock")
                        Text("Total Time*: \(totalTime)")
                    }
                    
                    HStack {
                        Image(systemName: "circle.circle")
                        Text("Servings*: \(servings)")
                    }
                }
            }
            
            ForEach(ingredientList, id: \.self) { index in
                HStack {
                    Image(systemName: hasIngredient ? "square" : "checkmark.square")
                        .onTapGesture {
                            hasIngredient.toggle()
                        }
                    Text(index)
                    }
                
            }
            
        }
        .padding()
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
