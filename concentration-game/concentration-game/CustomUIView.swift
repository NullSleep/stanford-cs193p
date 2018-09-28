//
//  TestsViewController.swift
//  concentration-game
//
//  Created by Carlos Arenas on 9/28/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    override func draw(_ rect: CGRect) {
        
        // Drawing a triangle
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 80, y: 50))
        path.addLine(to: CGPoint(x: 140, y: 150))
        path.addLine(to: CGPoint(x: 10, y: 150))
        path.close()
        
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.lineWidth = 3.0
        path.fill()
        path.stroke()
        
        // Drawing text
        let text = NSAttributedString(string: "Hello")
        text.draw(at: CGPoint(x: 45, y: 65))
        let textSize: CGSize = text.size() // How much space the string will take up
        print(textSize)
        
        // Accessing a range of characters in an NSAttributedString
        let pizzaJoint = "Café pesto"
        let attrString = NSMutableAttributedString(string: pizzaJoint)
        let firstWordRange = pizzaJoint.startIndex..<pizzaJoint.index(of: " ")!
        let nsrange = NSRange(firstWordRange, in: pizzaJoint)
        attrString.addAttribute(.strokeColor, value: UIColor.orange, range: nsrange)
        
    }
}
