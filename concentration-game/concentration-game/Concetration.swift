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
    
    // This index is used to know if there is a card face up and proceede to try to match the currently selected card
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        // Option 1
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
        // Option 2
        // cards[index].isFaceUp = cards[index].isFaceUp ? false : true
        
        // Ignoring all the cards that have been matched
        if !cards[index].isMatched {
            // The indexOfOneAndOnlyFaceUpCard has to exist and we ignore if the user selected again the same card
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                // Now there are two face up cards, so there is no 'one and only faced up card'
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
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
        
        // Shuffling the card array
        shuffleTheCardArray()
    }
    
    // MARK: - Private mehtods
    func shuffleTheCardArray(){
        var res = [Card]()
        for _ in 0..<cards.count {
            let rand = Int(arc4random_uniform(UInt32(cards.count)))
            res.append(cards[rand])
            cards.remove(at: rand)
        }
        cards = res
    }
}
