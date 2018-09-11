//
//  MiscExercises.swift
//  concentration-game
//
//  Created by Carlos Arenas on 9/7/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

class MiscExercises {
    
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
        
        // MARK: Computed properties
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
        // It is not necesary to implement the set (the property then becomes read only
        
        // IMPORTANT:
        // Foo is never stored anywhere instead everytime someone asks for foo it gets calculated with the
        // code inside get. And everytime someone set the value of foo the code inside set gets executed.
        // Why are they important? What do you use them for?
        // A lot of time many properties are derived from other states inside the struct, so you don't
        // want duplicated information that can get out of sync. So it is better to derive the information.
        
        // Keeping up this var up-to-date is just plain error-prone.
//        var indexOfOneAndOnlyFaceUpCard: Int?
        // This is safer
//        var indexOfOneAndOnlyFaceUpCard: Int? {
//            get {
//                // Look at all the cards and see if you find only one that's face up if so, return it,
//                // else return nil
//            }
//            set {
//                // Turn all the cards face down except the card at index newValue
//            }
//        }
    }
    
    func getSize() -> (weight: Double, height: Double) {
        return (250, 80)
    }
}
