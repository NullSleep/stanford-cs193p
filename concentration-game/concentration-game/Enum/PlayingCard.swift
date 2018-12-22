//
//  PlayingCard.swift
//  concentration-game
//
//  Created by Carlos Arenas on 12/22/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "" }
    
    var suit: Suit
    var rank: Rank
    
    // Raw values:
    // If the type of the enum is Int and we don't set explicit values then automatically all the enum cases will be 0, 1, 2 ...
    // If the type of the enum is String then all the enum cases will be the case name as string
    
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return "\(self.rawValue)"}
        
        case spades = "♠️"
        case clubs = "♣️"
        case hearts = "♥️"
        case diamonds = "♦️"
        
        //static var all: [Suit] = [.spades, .clubs, .hearts, .diamonds]
        static var all = [Suit.spades, .clubs, .hearts, .diamonds]
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
            // var allRanks: [Rank] = [.ace]
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
            return allRanks
        }
    }
}
