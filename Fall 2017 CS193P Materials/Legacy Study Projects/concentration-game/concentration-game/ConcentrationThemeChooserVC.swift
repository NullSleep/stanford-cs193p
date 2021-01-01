//
//  ConcentrationThemeChooserViewController.swift
//  concentration-game
//
//  Created by Carlos Arenas on 12/25/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserVC: LoggingViewController, UISplitViewControllerDelegate {
    
    override var vcLoggingName: String {
        return "ThemeChooser"
    }
    
    @IBOutlet weak var viewToAnimate: UIView!
    
    let themes = [
        "Vehicles": "🚀🚄🚉✈️🛫🏎⛴🛥🛩🚗🛰🚁🚤🚅🏍🚲",
        "Animals":  "🐶🐷🦊🦉🐍🐝🐗🐺🦑🦞🦎🐋🦈🦛🦍🦒",
        "Faces":    "😀🥳😭🤪😖😕🥵🥶😱😨🥰🤣🤕😷😈🙄"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateSuplementaryView()
    }
    
    // We do this to avoid the system running the first option in the MasterViewController from the SplitViewController as it automatically does.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        splitViewController?.delegate = self
    }
    
    // If we don't want the collapsing to happen we return true from this method. We don't want to collapse everytime the concentration game
    // has a nil theme.
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        
        return false // I didn't collapse so please collapse it.
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        // The last one in the splitViewController VCs should be the ConcentrationViewController
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }

    @IBAction func chooseTheme(_ sender: Any) {
        // We do this so the game doesn't reset again, but just changes the theme
        
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            // Instead of perfoming a Segue we the VC we saved to the navigationController so in the iPhone the game doesn't reset.
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme from VC", sender: sender)
        }
    }
    
    // MARK: - Navigation
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Segues always create a new MVC
        if segue.identifier == "Choose Theme" || segue.identifier == "Choose Theme from VC" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    lastSeguedToConcentrationViewController = cvc
                }
            }
        }
    }

}

// MARK: - UIView Animations

extension ConcentrationThemeChooserVC {
    
    func animateSuplementaryView() {
        
        // For this to work the Alpha in the storyboard of viewToAnimate should be 1
        // We check if viewToAnimate exists because it's removed from the super view and might be nil
        if let viewToAnimate = viewToAnimate, viewToAnimate.alpha == 1.0 {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: 3.0,
                delay: 2.0,
                options: [.allowUserInteraction],
                animations: { self.viewToAnimate.alpha = 0.0 },
                completion: { if $0 == .end { self.viewToAnimate.removeFromSuperview() } }
            )
            
            print("alpha = \(viewToAnimate.alpha)")
        }

        // For this to work the Alpha in the storyboard of viewToAnimate should be 0
//        UIView.animate(withDuration: 3.0, animations: {
//            self.viewToAnimate.alpha = 1.0
//        })
    }
}
