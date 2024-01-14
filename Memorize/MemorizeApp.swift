//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jeric Hernandez on 11/24/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
