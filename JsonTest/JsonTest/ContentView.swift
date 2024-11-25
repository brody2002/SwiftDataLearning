//
//  ContentView.swift
//  JsonTest
//
//  Created by Brody on 11/25/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var animalData: [AnimalSwiftData]
    @Environment(\.modelContext) var mainContext
    @State var dataHelper = DataHelper()
    @State var addItem: Bool = false
    
    var body: some View {
        NavigationStack{
            Form{
                List{
                    ForEach(animalData, id: \.self){
                        animal in
                        Text("Animal: \(animal.name)")
                    }.onDelete(perform: delete)
                    
                }
                
            }
            .onAppear{
                dataHelper.loadAnimals()
                for animal in dataHelper.animalList{
                    let x = AnimalSwiftData(name: animal.name)
                    mainContext.insert(x)
                }
                
            }
            .toolbar {
                ToolbarItem{
                    Button(action:{
                        addItem.toggle()
                    }, label:{
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $addItem) {
                AddAnimalView() 
            }
        }
            
    }
    
    func delete(_ indexSet: IndexSet) {
        for i in indexSet {
            let animal = animalData[i]
            mainContext.delete(animal)
        }
    }
}

#Preview {
    ContentView()
        
}
