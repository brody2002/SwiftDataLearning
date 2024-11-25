//
//  BundleCodable.swift
//  FakeFantasySports
//
//  Created by Brody on 11/25/24.
//
import Foundation

struct loadedPlayer: Codable {
    var firstName: String
    var lastName: String
    var team: String
    var points: Float
    var assists: Float
    var rebounds: Float
    var blocks: Float
    var steals: Float
    var turnovers: Float
    var fgPercentage: Float
    var plusMinus: Float

    init(firstName: String, lastName: String, team: String, points: Float, assists: Float, rebounds: Float, blocks: Float, steals: Float, turnovers: Float, fgPercentage: Float, plusMinus: Float) {
        self.firstName = firstName
        self.lastName = lastName
        self.team = team
        self.points = points
        self.assists = assists
        self.rebounds = rebounds
        self.blocks = blocks
        self.steals = steals
        self.turnovers = turnovers
        self.fgPercentage = fgPercentage
        self.plusMinus = plusMinus
    }
    
    enum CodingKeys: String, CodingKey {
            case firstName
            case lastName
            case team
            case points = "pts"
            case assists
            case rebounds
            case blocks
            case steals
            case turnovers
            case fgPercentage
            case plusMinus
        }
}
@Observable
class DataController {
    var playerList: [loadedPlayer] = []
    
    
    func loadPlayers(){
        guard let url = Bundle.main.url(forResource: "NBAData", withExtension: "json") else {
            print("failed to locate file")
            return
        }
        guard let data = try? Data (contentsOf: url) else{
            print("failed to extract the data")
            return
        }
        
        guard let players = try? JSONDecoder().decode([loadedPlayer].self, from: data) else{
            print("failed to move")
            return
        }
        
        self.playerList = players

    }
        
}

