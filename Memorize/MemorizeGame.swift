//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Jeric Hernandez on 1/14/24.
//

// Model

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {}
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
