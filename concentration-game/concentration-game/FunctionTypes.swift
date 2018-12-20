//
//  FunctionTypes.swift
//  concentration-game
//
//  Created by Carlos Arenas on 12/15/18.
//  Copyright © 2018 Polygon. All rights reserved.
//

import Foundation

// Functions are first class types. They can be passed around as any other data structure

class funcrtionTypes {
    
    // MARK: - FUNCTION TYPES
    
    func basicFunctionTypes() {
        var operation: (Double) -> Double
        operation = sqrt //sqrt is a system function that recives a Double and returns a Double
        let result = operation(4.0)
        print(result)
    }
    
    // MARK: - CLOSURES
    
    // When you can to create an funtion "on the fly"
    func changeSignFunctionType() {

        func changeSign(operand: Double) -> Double { return -operand }
        
        var operation: (Double) -> Double
        operation = changeSign
        let result = operation(4.0)
        print(result)
    }
    
    // Closures are inline functions
    func changeSignClosure1() {
        var operation: (Double) -> Double
        operation = { (operand: Double) -> Double in return -operand }
        let result = operation(4.0)
        print(result)
    }
    
    // Using type inference
    func changeSignClosure() {
        var operation: (Double) -> Double
        
        // Swfit knows it returns a Double so it is not necesary to add the type
        //operation = { (operand: Double) in return -operand }
        
        // Swfit also knows that the operand is Double so it's not necvessary to set the type
        //operation = { (operand) in return -operand }
        
        // It also knows that the function returns somehting so they keyword return is not necessary
        // operation = { (operand) in -operand }
        
        // Swift knows that embedded functions are common so instead of naming parameters we can use default parameters names
        operation = { -$0 }
        
        let result = operation(4.0)
        print(result)
    }
    
}
