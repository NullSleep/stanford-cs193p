//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Carlos Arenas on 12/21/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

// CustomStringConvertible is protocol that allows printing the descripCtion in the console if we print objects of type PlayingCard
// Since the containing struct PlayingCard implements the protocol CustomStringConvertible both Suit and Rank have to implement it
struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(rank)\(suit)" }
    
    var suit: Suit
    var rank: Rank
    
    // Raw values
    // enum Suit: Int { >> If the type of the enum is Int and we don't se the values explicitly then automatically the raw value of spades would
    // be 0, hearts be 1, diamonds be 2 and clubs be 3.
    // If the type of the enum is String then automatically the raw value of spades would be "spades", hearts be "hearts", etcs
    
    // In this case we will specifally set the raw value
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return "\(self.rawValue)" }
        
        case spades = "♠️"
        case diamonds = "♦️"
        case hearts = "♥️"
        case clubs = "♣️"
        
        //static var all: [Suit] = [.spades, .hearts, .diamonds, .clubs]
        // Equivalent way of crating the array of Suitss
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
    }
    
    enum Rank: CustomStringConvertible {
    
        var description: String {
            switch self {
            case .ace: return "1"
            case .numeric(let pips): return "\(pips)"
            case .face(let kind): return kind
            }
            
        }
    
        case ace
        case face(String) //J, Q, K
        case numeric(Int) //2, 3, 4, 5, 6, 7, 8, 9, 10
        
        // What is a pip https://en.wikipedia.org/wiki/Pip_(counting)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            //var allRanks: [Rank] = [.ace]
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), face("Q"), face("K")]
            return allRanks
        }
    }
}
