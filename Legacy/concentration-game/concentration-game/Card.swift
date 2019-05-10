//
//  Card.swift
//  concentration-game
//
//  Created by Carlos Arenas on 8/23/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

// Since this is the Model and it is UI independent it doesn't need to have emoji or jpg or similar UI data
// This is the behaviour of the card.
struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    var hashValue: Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    // Unique Int associated with thre Type rather than individual instance
    private static var indentifierFactory = 0
    
    // Every time I call it it will return an unique int
    private static func getUniqueIdentifier() -> Int {
        indentifierFactory += 1
        return indentifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
