//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Jeric Hernandez on 1/14/24.
//

// Model

import Foundation

struct MemoryGame<CardContent> {
    // access control
    private(set) var cards: [Card]
    // functions as types
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []

        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    func choose(card: Card) {}

    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
