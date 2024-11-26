//
//  DataHelper.swift
//  JsonTest
//
//  Created by Brody on 11/25/24.
//

import Foundation
import SwiftData

// Loadable Json Data
struct Animal: Decodable{
    var name: String
    var favColor: String
    
    init(name: String, favColor: String) {
        self.name = name
        self.favColor = favColor
    }
}

// Loading Json
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

// Swift Data
@Model
class AnimalSwiftData : Identifiable{
    var id: UUID?
    var name: String?
    var favColor: String?
    init(name: String?, favColor: String?){
        self.id = UUID()
        self.name = name
        self.favColor = favColor
    }
}
