//
//  AddAnimalView.swift
//  JsonTest
//
//  Created by Brody on 11/25/24.
//

import SwiftUI

struct AddAnimalView: View {
    @Environment(\.modelContext) var mainContext
    @Environment(\.dismiss) var dismiss
    
    @State var animalName: String = ""
    @State var favColor: String = ""
    var body: some View {
        Form{
            Section{
                TextField("Add Animal", text: $animalName)
                    .padding()
            }
            Section{
                TextField("Fav Color", text: $favColor)
                    .padding()
            }
            Section{
                Button(action:{
                    mainContext.insert(AnimalSwiftData(name: animalName, favColor: favColor))
                    dismiss()
                    
                }, label: {})
            }
            
        }
        
    }
}

#Preview {
    AddAnimalView()
}
