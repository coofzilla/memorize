//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Jeric Hernandez on 1/14/24.
//

// Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    // access control
    private(set) var cards: [Card]
    // functions as types
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []

        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }

    mutating func choose(card: Card) {}

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Equatable, Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent

        var id: String
    }
}
