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
    
    var flipCount = 0
    
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
        filpCount +=
        flipCard(withEmoji: "🛠", on: sender)
    }
    
    @IBAction func touchSecondCarrd(_ sender: UIButton) {
        flipCard(withEmoji: "🚄", on: sender)
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
