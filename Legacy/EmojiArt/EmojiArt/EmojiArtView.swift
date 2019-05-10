//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Carlos Arenas on 1/18/19.
//  Copyright © 2019 Polygon. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {
    var backgroundImage: UIImage? { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
}
