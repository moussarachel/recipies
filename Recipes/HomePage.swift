//
//  HomePage.swift
//  Recipes
//
//  Created by Rachel  Moussa  on 12/7/22.
//

import SwiftUI

struct HomePage: View {
    
    @State var searchText: String = ""
    @State var currentCatagory: String = "All"
    @State var newGroup: Bool = false
    @State var groupTitle: String = "dfg"
    @State var groups: [String] = []
    
//    @State var newCard: [Card] = []
    
    @Binding var newCard: [Card]
    
    var body: some View {
        
        NavigationView {
            //ZStack {
                
                //            Color.brown.opacity(0.1).ignoresSafeArea()
                
                VStack (alignment: .leading){
                    
                    HStack {
                        Text("Recipes")
                            .font(.title)
                            .bold()
                        Image(systemName: "text.book.closed")
                    }
                    .padding()
                    
                    Text(currentCatagory)
                        .padding(.leading, 20)
                        .foregroundColor(.gray)
                        .font(.headline)
                    
                    
                    Divider()
                        .padding([.leading, .trailing], 20)
                    
                    SearchBar(searchText: $searchText)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        HStack (spacing: 45) {
                            
//                            NavigationLink {
//                                <#code#>
//                            } label: {
//                                Text("Break")
//                            }

                            Text("Breakfast")
                                .foregroundColor(.gray)
                                .font(.headline)
                            Text("Lunch")
                                .foregroundColor(.gray)
                                .font(.headline)
                            Text("Diner")
                                .foregroundColor(.gray)
                                .font(.headline)
                            
                            ForEach(groups, id: \.self) { _ in
                                Text(groupTitle)
                                    .foregroundColor(.gray)
                                    .font(.headline)
                            }
                            
                            Button {
                                newGroup.toggle()
                            } label: {
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(width: 20, height: 10)
                                    .padding()
                                    .background(Color.gray)
                                    .cornerRadius(20)
                            }
                            .alert("", isPresented: $newGroup) {
                                TextField("", text: $groupTitle)
                                Button("Add") {
                                    groups.append("")
                                }
                            }
                            
                        }
                        
                    }.padding()
                        .sheet(isPresented: $newGroup) {
                            //add view
                        }
                    
                    ScrollView {
                        ForEach(0..<newCard.count, id: \.self) { index in
                            NavigationLink {
                                CardView(recipeName: newCard[index].recipeName, prepTime: newCard[index].prepTime, cookTime: newCard[index].cookTime, totalTime: newCard[index].totalTime, servings: newCard[index].servings, instructions: newCard[index].instructions)
                            } label: {
                                RecipeCard(recipeName: newCard[index].recipeName, totalTime: newCard[index].totalTime, servings: newCard[index].servings)
                            }
                            .foregroundColor(.black)
                            
                        }
                    }
                    
                    Spacer()
                }
                
//            }
        }
        
    }
    
}

//struct HomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePage()
//    }
//}

struct AddGroup: View {
    
    @State var groupTitle: String = ""
    
    var body: some View {
        
        HStack {
            Text("Title")
                .font(.headline)
            TextField("", text: $groupTitle)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
        }
        
    }
}
