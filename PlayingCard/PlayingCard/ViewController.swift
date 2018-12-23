//
//  ViewController.swift
//  PlayingCard
//
//  Created by Carlos Arenas on 12/21/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)", terminator:" - ")
            }
        }
    }

}

