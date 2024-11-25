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
    var body: some View {
        Form{
            Section{
                TextField("Add Animal", text: $animalName)
                    .padding()
            }
            Section{
                Button(action:{
                    mainContext.insert(AnimalSwiftData(name: animalName))
                    dismiss()
                    
                }, label: {})
            }
            
        }
        
    }
}

#Preview {
    AddAnimalView()
}
