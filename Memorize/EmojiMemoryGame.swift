//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jeric Hernandez on 1/14/24.
//

// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static var emojis: [String] = []

    private let spaceEmojis = ["🌌", "🚀", "🪐", "🌠", "🌛", "👽", "🌍", "🛰", "🔭", "💫", "☄️", "🌟"]
    private let christmasEmojis = ["🎄", "🎅", "🦌", "🎁", "❄️", "⛄"]
    private let halloweenEmojis = ["🎃", "🎃", "👻", "👻", "🕸️", "🕸️", "🦇", "🦇", "🍬", "🍬", "🧙‍♀️", "🧙‍♀️"]
    private let beachEmojis = ["🏖️", "🏖️", "🌊", "🌊", "🏄‍♂️", "🏄‍♂️", "🌴", "🌴", "🌞", "🌞", "⛱️", "⛱️"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🚨"
            }
        }
    }

    init() {
        changeTheme(to: .christmas)
    }

    @Published private var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func changeTheme(to theme: Theme) {
        switch theme {
        case .christmas:
            EmojiMemoryGame.emojis = christmasEmojis.shuffled()
        case .halloween:
            EmojiMemoryGame.emojis = halloweenEmojis.shuffled()
        case .beach:
            EmojiMemoryGame.emojis = beachEmojis.shuffled()
        }

        model = EmojiMemoryGame.createMemoryGame()
    }
}
