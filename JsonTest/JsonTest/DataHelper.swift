//
//  DataHelper.swift
//  JsonTest
//
//  Created by Brody on 11/25/24.
//

import Foundation
import SwiftData


struct Animal: Decodable{
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

@Observable
class DataHelper: ObservableObject {
    var animalList: [Animal] = []
    
    func loadAnimals(){
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("couldnt locate the data")
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("couldnt obtain the data from the json file")
            return
        }
        guard let loadedData = try? JSONDecoder().decode([Animal].self, from: data) else {
            print("couldnt abstract the data into a class")
            return
        }
        animalList = loadedData
    }
}


@Model
class AnimalSwiftData : Identifiable{
    var id: UUID
    var name: String
    init(name: String){
        self.id = UUID()
        self.name = name
    }
}
