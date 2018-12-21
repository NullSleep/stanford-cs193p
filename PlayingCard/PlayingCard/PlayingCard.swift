//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Carlos Arenas on 12/21/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

// CustomStringConvertible is protocol that allows printing the descriotion in the console if we print objects of type PlayingCard
struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(rank)\(suit)" }
    
    var suit: Suit
    var rank: Rank
    
    // Raw value
    // If the type of the enum is Int then automatically the raw value of spades would be 0, hearts be 1, diamonds be 2 and clubs be 3
    //enum Suit: Int {
    // If the type of the enum is String then automatically the raw value of spades would be "spades", hearts be "hearts", etc
    //enum Suit: String {
    // In this case we will specifally set the raw value
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return "\(self.rawValue)" }
        
        case spades = "♠️"
        case diamonds = "♦️"
        case hearts = "♥️"
        case clubs = "♣️"
        
        // Equivalent way of crating the array of Suits
        //static var all: [Suit] = [.spades, .hearts, .diamonds, .clubs]
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
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J" : return 11
            case .face(let kind) where kind == "Q" : return 12
            case .face(let kind) where kind == "K" : return 13
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
