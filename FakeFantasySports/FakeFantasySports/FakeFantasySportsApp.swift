//
//  FakeFantasySportsApp.swift
//  FakeFantasySports
//
//  Created by Brody on 11/25/24.
//

import SwiftUI
import SwiftData

@main
struct FakeFantasySportsApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Player.self)
                
        }
    }
}
