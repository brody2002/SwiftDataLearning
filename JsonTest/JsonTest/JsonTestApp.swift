//
//  JsonTestApp.swift
//  JsonTest
//
//  Created by Brody on 11/25/24.
//

import SwiftData
import SwiftUI


@main
struct JsonTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: AnimalSwiftData.self)
        }
    }
}
