//
//  RowView.swift
//  FakeFantasySports
//
//  Created by Brody on 11/25/24.
//

import Foundation
import SwiftUI


struct RowView: View {
    
    var player: Player
    init(player: Player) {
        self.player = player
    }
    let roundedString: (Float) -> String = { input in
        String(format: "%.2f", input)
    }
    
    var body: some View{
       
            HStack{
                Spacer()
                Image(playerToImage(name: player.firstName))
                    .resizable()
                    .frame(width: 70, height: 60)
                    .clipShape(Capsule())
                Spacer()
                
                
                VStack(alignment: .center){
                    Text(player.firstName)
                        .font(.title)
                    Text(player.lastName)
                        .font(.title2)
                    Text(player.team)
                        .font(.title3)
                }
                
                Spacer()
                
                
                VStack(alignment: .center){
                    Text("Pts:\(roundedString(player.points))")
                    Text("Asts:\(roundedString(player.assists))")
                    Text("Rebs:\(roundedString(player.rebounds))")
                }
                Spacer()
                
            }
            
        
        
    }
    
    func playerToImage(name: String) -> String {
        switch name {
        case "LeBron":
            return "LeBronJames"
        case "Stephen":
            return "StephenCurry"
        case "Giannis":
            return "GiannisAntetokounmpo"
        case "Kevin":
            return "KevinDurant"
        case "Nikola":
            return "NikolaJokic"
        case "Luka":
            return "LukaDoncic"
        case "Joel":
            return "JoelEmbiid"
        case "Jayson":
            return "JaysonTatum"
        case "Jimmy":
            return "JimmyButler"
        case "Ja":
            return "JaMorant"
        case "Anthony":
            return "AnthonyDavis"
        case "Damian":
            return "DamianLillard"
        default:
            return "LebronJames" // Return a default image if no match is found
        }
    }

}
