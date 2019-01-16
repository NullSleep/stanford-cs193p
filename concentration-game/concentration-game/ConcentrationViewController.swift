//
//  ViewController.swift
//  concentration-game
//
//  Created by Carlos Arenas on 8/12/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import UIKit

class ConcentrationViewController: LoggingViewController {
    
    // MARK: - Instance variables
    
    override var vcLoggingName: String {
        return "Game"
    }

    // Using a lazy property. Since game depends on another property and it can be intialized inmediately, lazy allows to
    // only intialize until some ask for it.
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    // Short version. We can do this only because it is read-only (only has a get)
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    // Initializing a variable doesn't initation the didSet
    private(set) var flipCount = 0 {
        // Property observers. The code is observing change like this. Property observer should be used a
        // lot to update change from the UI.
        didSet {
            updateCountLabel()
        }
    }
    
    var emoji = [Card: String]()
    
    // Swift can't infer the type that comes fom a UI file.
    // iOS by default runs the didSet of an UI Outlet when they are connected.
    @IBOutlet private weak var flipCountLabel: UILabel! {
        // When we have an Outlet didSet does get called when iOS makes the connection with the Outlet
        didSet {
            updateCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    // var emojiChoices = ["🚀", "🚄", "🚉", "✈️", "🛫", "🏎", "⛴", "🛥", "🛩", "🚗", "🛰", "🚁",  "🚤", "🚅", "🏍",  "🚲"]
    var emojiChoices = "🚀🚄🚉✈️🛫🏎⛴🛥🛩🚗🛰🚁🚤🚅🏍🚲"
    
    // MARK: - View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not on cardButtons")
        }
    }
    
    // MARK: - Private mehtods
    
    private func updateViewFromModel() {

        // Countable range of all the indexes
        if cardButtons != nil {
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
        
    }
    
    private func emoji(for card: Card) -> String {
        
        // We'll check if the card  doesn't  exist and assign it a random emoji
        if emoji[card] == nil, emojiChoices.count > 0 {
            
            // Instead of just assigninig the emoji character we remove it also. Since the function remove inmediately
            // returns what is being removed we can both assign the emoji and delete from the list so it may not reappear
            // in a later asigment.
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4Rrandom)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        // This is exactly the same as the above != nil coparison
        return emoji[card] ?? "!!!"
    }
    
    private func updateCountLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.8196078431, green: 0.2980392157, blue: 0.3529411765, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
}

extension Int {
    var arc4Rrandom: Int {
        // Converting the int value of emojiChoices.count to UInt32 required by the arc4random_uniform function
        // Then converting back Int again
        if self > 0 {
            // Self is the Int that is going to be the upper bound for the random number
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
