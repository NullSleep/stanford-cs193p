//
//  ViewController.swift
//  concentration-game
//
//  Created by Carlos Arenas on 8/12/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Instance variables
    // Since game depends on another property and it can be intialized inmediately, lazy allows to only intialize until
    // some ask for it.
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        // Property observers. The code is observing change like this. Property observer should be used a
        // lot to update change from the UI.
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // var emoji = Dictionary<Int, String>()
    var emoji = [Int:String]()
    
    // Swift can't infer the type that comes fom a UI file
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🚀", "🚄", "🚉", "✈️", "🛫", "🏎", "⛴", "🛥", "🛩", "🚗", "🛰", "🚁",  "🚤", "🚅", "🏍",  "🚲"]
    
    // MARK: - View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not on cardButtons")
        }
    }
    
    // MARK: - Private mehtods
    
    func updateViewFromModel() {
        // cardButtons is a sequence of buttons so we can loop through it.
        // for button in cardButtons { }
        // Countable range
        // for index in 0..<cardButtons.count { }
        
        // Countable range of all the indexes
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.8862745098, green: 0.2431372549, blue: 0.3411764706, alpha: 1)
            }
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipcard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.2431372549, blue: 0.3411764706, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = UIColor.hexStringToUIColor(hex: "e23e57")
        }
    }
    
    func emoji(for card: Card) -> String {
        // Looking for value in a dictionary always returns an optional
        // let choosenEmoji = emoji[card.identifier]
        
        // Another way of dealing with optionals
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "!!!"
//        }
        
        // We'll check if the card  doesn't  exist and assign it a random emoji
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            // Converting the int value of emojiChoices.count to UInt32 required by the arc4random_uniform function
            // Then converting back Int again
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            //emoji[card.identifier] = emojiChoices[randomIndex]
            
            // Instead of just assigninig the emoji character we remove it also. Since the function remove inmediately
            // returns what is being removed we can both assign the emoji and delete from the list so it may not reappear
            // in a later asigment.
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        // This is exactly the same as the above != nil coparison
        return emoji[card.identifier] ?? "!!!"
    }
}
