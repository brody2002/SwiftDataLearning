//
//  Player.swift
//  FakeFantasySports
//
//  Created by Brody on 11/25/24.
//


import Foundation
import SwiftData

@Model
class Player{
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
    
    func printPlayer(){
        print("Name: \(self.firstName), \(self.lastName)\nPoints: \(self.points): Assists: \(self.assists): Rebounds: \(self.rebounds)\nBlocks: \(self.blocks), Steals: \(self.steals)")
    }
}






