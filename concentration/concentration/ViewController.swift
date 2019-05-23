//
//  ViewController.swift
//  concentration
//
//  Created by Carlos Arenas on 5/9/19.
//  Copyright © 2019 Polygon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Instance Variables
    var flipCount = 0 {
        // Property observers
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //var emojiChoices: Array<String> = ["🛩", "🚅", "🏎", "🛥"]
    var emojiChoices = ["🛩", "🚅", "🛩", "🚅"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // @IBOutlet var cardButtons: Array<UIButton>!
    @IBOutlet var cardButtons: [UIButton]!
    
    // MARK: - Class Methods
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Card not found!")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji emoji \(emoji))")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.831372549, blue: 0.3764705882, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

