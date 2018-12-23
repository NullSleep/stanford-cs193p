//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Carlos Arenas on 12/23/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // Drawing a circle using CG (Core graphics)
        
        // We can't draw without getting the context
//        if let context = UIGraphicsGetCurrentContext() {
//            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY),
//                           radius: 100.0,
//                           startAngle: 0,
//                           endAngle: 2 * CGFloat.pi,
//                           clockwise: true)
//            context.setLineWidth(5.0)
//            UIColor.green.setFill()
//            UIColor.red.setStroke()
//            context.strokePath()
//            context.fillPath() // This doesn't work because the when we context.strokePath the path have been consumed.
//        }
        
        // Drawing a circle using UIBezierPath which allows to fill the circle.
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
//                    radius: 100.0,
//                    startAngle: 0,
//                    endAngle: 2 * CGFloat.pi,
//                    clockwise: true)
//        path.lineWidth = 5.0
//        UIColor.green.setFill()
//        UIColor.red.setStroke()
//        path.stroke()
//        path.fill()
        
        // When we rotate the screen by default what it does is take the bounds and scales them to the new bounds. This often creates
        // elongated deformed views.
    }

}
