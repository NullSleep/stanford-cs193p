//
//  ConcentrationThemeChooserViewController.swift
//  concentration-game
//
//  Created by Carlos Arenas on 12/25/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    
    let themes = [
        "Vehicles": "🚀🚄🚉✈️🛫🏎⛴🛥🛩🚗🛰🚁🚤🚅🏍🚲",
        "Animals":  "🐶🐷🦊🦉🐍🐝🐗🐺🦑🦞🦎🐋🦈🦛🦍🦒",
        "Faces":    "😀🥳😭🤪😖😕🥵🥶😱😨🥰🤣🤕😷😈🙄"
    ]

    @IBAction func chooseTheme(_ sender: Any) {
        if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            
        } else {
            
        }
        performSegue(withIdentifier: "Choose Theme from VC", sender: sender)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Segues always create a new MVC
        if segue.identifier == "Choose Theme" || segue.identifier == "Choose Theme from VC" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }

}
