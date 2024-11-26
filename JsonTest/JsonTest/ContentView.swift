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
    @State var searchText: String = ""
    
    @State var selectedTokens: [ColorToken] = []

    
    var suggestedTokens: [ColorToken] {
        let uniqueColors = Set(animalData.map { $0.favColor.localizedLowercase })
        return uniqueColors.map { ColorToken(name: $0) }
    }

    
    var filteredAnimalData: [AnimalSwiftData] {
        animalData.filter { animal in
            // Match search text or show all if searchText is empty
            let matchesSearchText = searchText.isEmpty || animal.name.localizedLowercase.contains(searchText.localizedLowercase)
            
            // Match selected tokens or show all if no tokens are selected
            let matchesTokens = selectedTokens.isEmpty || selectedTokens.contains { $0.name == animal.favColor.localizedLowercase }
            
            return matchesSearchText && matchesTokens
        }
    }
    
    var selectedColor: (String) -> Color = { color in
            let color = color.localizedLowercase
            switch color {
            case "red":
                return Color.red
            case "yellow":
                return Color.yellow
            case "blue":
                return Color.blue
            default:
                return Color.green
            }
        }
    
    var body: some View {
        NavigationStack{
            Form{
                List{
                    ForEach(filteredAnimalData, id: \.self){
                        animal in
                        Text("Animal: \(animal.name)")
                            .padding()
                            .background(selectedColor(animal.favColor))
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            .bold()
                            
                            
                    }.onDelete(perform: delete)
                    
                }
                
            }
            .onAppear{
                dataHelper.loadAnimals()
                for animal in dataHelper.animalList{
                    let x = AnimalSwiftData(name: animal.name, favColor: animal.favColor)
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
                ToolbarItem(placement: .topBarLeading) {
                    Button(action:{
                        for animal in animalData{
                            mainContext.delete(animal)
                        }
                    }, label:{
                        Image(systemName: "trash")
                    })
                }
                
            }
            .sheet(isPresented: $addItem) {
                AddAnimalView() 
            }
            .searchable(
                text: $searchText,
                tokens: $selectedTokens,
                suggestedTokens: .constant(suggestedTokens),
                prompt: "Find animals 🦦"
            ) { token in
                Label(token.name.capitalized, systemImage: "paintpalette")
            }
            
            
        }
            
    }
    
    func delete(_ indexSet: IndexSet) {
        for i in indexSet {
            let animal = animalData[i]
            mainContext.delete(animal)
        }
    }
    
    struct ColorToken: Identifiable, Hashable {
        var id: String { name }
        var name: String
    }
}

#Preview {
    ContentView()
        
}
