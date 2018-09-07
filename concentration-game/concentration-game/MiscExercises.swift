//
//  MiscExercises.swift
//  concentration-game
//
//  Created by Carlos Arenas on 9/7/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

class MiscExercise {
    
    func execute() {
        // MARK: Floating point CountableRange
        // stride is a function that create a coutable range.
        // CountableRange is a generic type. It can count over multiple types (int, double, etc)
        for i in stride(from: 0.5, to: 15.25, by: 0.3) {
            print(i)
        }
        
        // MARK: Tuples
        // Nothing more than a grouping of values. You can use it anywhere you can use a type.
        
        let x: (String, Int, Double) = ("Hello", 5, 0.85) // The type of x is a tuple
        let (word, number, value) = x
        print(word)
        print(number)
        print(value)
        
        // Or the tuple elements can be named when the tuple is declared (this is strongly preferred)
        let z: (w: String, i: Int, v: Double) = ("Hello", 5, 0.85)
        print(z.w)
        print(z.i)
        print(z.v)
        
        // This also legal
        let (wrd, num, val) = x
        print(wrd)
        print(num)
        print(val)
        
        // Tuples are great to returning mutliple values from a function or a method.
        let size = getSize()
        print("The weight is \(size.weight)")
        print("The height is \(getSize().height)")
        
        // MARK: Computer properties
        // The value of a property can be computed rahter than stored
        // A typical property looks somehting like this:
//        var foo: Double
        // A computed property looks like this:
//        var foo: Double {
//            get {
//                // Return the calculated value of foo
//            }
//            set(newValue) {
//                // do somehting based on the fact that foo has changed to newValue
//            }
//        }
        // It is not necesdary to implement the set (the property then becomes read only
    }
    
    func getSize() -> (weight: Double, height: Double) {
        return (250, 80)
    }
}
