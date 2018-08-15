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
    
    var flipCount = 0 {
        // Property observers. The code is observing change like this. Property observer should be used a
        // lot to update change from the UI.
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    // Swift can't infer the type that comes fom a UI file
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // @IBOutlet var cardBuTTons: [UIButton]!
    @IBOutlet var cardBuTTons: Array<UIButton>
    
    // MAK: - View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        flipCard(withEmoji: "🛠", on: sender)
    }
    
    // MNARK: - Private mehtods
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipcard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = UIColor.hexStringToUIColor(hex: "e23e57")
        }
    }
}
