//
//  Concetration.swift
//  concentration-game
//
//  Created by Carlos Arenas on 8/23/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

class Concentration {
    // MARK: - Public Application Program Interface
    // var cards = Array<Card>()
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
        // cards[index].isFaceUp = cards[index].isFaceUp ? false : true
        
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // Free intializer for the strucs
        // let card = Card(isFaceUp: , isMatched: , identifier: )
        
        for _ in 0..<numberOfPairsOfCards {
            // The concetration game doesn't care about what the identifiers are. It only care it they are unique.
            // The card itself should figure it's identifier.
            // let card = Card(identifier: identifier)
            let card = Card()
            
            // Option 1
            // When you asign a struct to another variable it copies it. Therefore matchiung card is a copy of card.
            // let matchingCard = card
            
            // Option 2
            // When you append the card to the array it also copies it.
            // cards.append(card)
            // cards.append(card)
            
            // Option 3
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}
