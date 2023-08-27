//
//  ContentView.swift
//  CRUD_Application
//
//  Created by A.f. Adib on 8/26/23.
//

import SwiftUI

struct ContentView: View {
    @State var fruits : [String] = ["Apples", "oranges", "bananas", "lemons"]
    var body: some View {
        NavigationView {
            
            List{
                
                Section {
                    ForEach(fruits, id: \.self) { Index in
                        Text(Index.capitalized)
                            .padding(.vertical)
                    }
                      
                      .onDelete(perform: deelete)
                      .onMove(perform: move)
                      .listRowBackground(Color.mint)
                      .font(.title3)
                    
                }
                
                
            header: {
                HStack{
                    Text("Fruits")
                    Image(systemName: "smiley")
                }
                    
                    .foregroundColor(Color.pink)
                        .font(.largeTitle)
                }   .accentColor(Color.mint)
                
                
                Section {
                    ForEach(fruits, id: \.self) { Index in
                        Text(Index.capitalized)
                    } .listRowBackground(Color.cyan)
                    
                }
            header: {
                HStack{
                    Text("Vegetables")
                        .foregroundColor(Color.purple)
                    Image(systemName: "")
                }
                    
                  
                        .font(.title)
                }
                
            }
            
            
            
//            .listStyle(DefaultListStyle())
            .navigationTitle(Text("Grocery items"))
            
            .navigationBarItems(leading: EditButton(), trailing:Button("Add",
                action: {
                        fruits.append("coconut")
            }))
            
        }
        
        }
    func deelete( indexSet : IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices : IndexSet, newPlace : Int ){
        fruits.move(fromOffsets: indices , toOffset: newPlace)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
