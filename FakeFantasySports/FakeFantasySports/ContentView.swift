//
//  ContentView.swift
//  FakeFantasySports
//
//  Created by Brody on 11/25/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Query var playerList: [Player]
    @Environment(\.modelContext) var modelContext
    var dataController = DataController()
    
    @State var navPath: NavigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            List {
                ForEach(playerList, id: \.self) { player in
                    RowView(player: player)
                }
                .onDelete(perform: deletePlayers)
            }
            .navigationTitle("Players") // Ensure a navigation title is set
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Add Data") {
                        for item in dataController.playerList {
                            let player = Player(
                                firstName: item.firstName,
                                lastName: item.lastName,
                                team: item.team,
                                points: item.points,
                                assists: item.assists,
                                rebounds: item.rebounds,
                                blocks: item.blocks,
                                steals: item.steals,
                                turnovers: item.turnovers,
                                fgPercentage: item.fgPercentage,
                                plusMinus: item.plusMinus
                            )
                            modelContext.insert(player)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: deleteAllPlayers) {
                        Image(systemName: "trash")
                    }
                }
            }
        }
        .onAppear {
            dataController.loadPlayers()
        }
    }
    
    private func deletePlayers(at offsets: IndexSet) {
        for index in offsets {
            let player = playerList[index]
            modelContext.delete(player)
        }
    }
    
    private func deleteAllPlayers() {
        for player in playerList {
            modelContext.delete(player)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Player.self, inMemory: true)
        
}
