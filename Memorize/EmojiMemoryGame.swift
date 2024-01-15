//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeric Hernandez on 1/14/24.
//

// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static var emojis: [String] = ["🌌", "🚀", "🪐", "🌠", "🌛", "👽", "🌍", "🛰", "🔭", "💫", "☄️", "🌟"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🚨"
            }
        }
    }

    @Published private var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    // MARK: Intents

    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
