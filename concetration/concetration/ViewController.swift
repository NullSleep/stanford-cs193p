//
//  ViewController.swift
//  concetration
//
//  Created by Carlos Arenas on 8/2/18.
//  Copyright © 2018 Carlos Arenas. All rights reserved.
//

import UIKit

// Functions can go outside the class making the global. But we intend to keep everything object oriented

class ViewController: UIViewController {

    @IBAction func touchCards(_ sender: UIButton) {
        flipCard(withEmoji: "😬", on: sender)
    }
    
    // The requirment for writtring a function with parameters is that it should read like english
    func flipCard(withEmoji emoji: String, on button: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

