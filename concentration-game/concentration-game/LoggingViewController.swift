//
//  LoggingViewController.swift
//  concentration-game
//
//  Created by Carlos Arenas on 1/15/19.
//  Copyright © 2019 Polygon. All rights reserved.
//

import UIKit

class LoggingViewController: UIViewController {

    private struct LogGlobals {
        var prefix = ""
        var instanceCounts = [String:Int]()
        var lastLogTime = Date()
        var indentationInterval: TimeInterval = 1
        var indentationString = "__"
    }
    
    private static var logGlobals = LogGlobals()
    
    private static func logPrefix(for loggingName: String) -> String {
        if logGlobals.lastLogTime.timeIntervalSinceNow < -logGlobals.indentationInterval {
            logGlobals.prefix += logGlobals.indentationString
            print("")
        }
        logGlobals.lastLogTime = Date()
        return logGlobals.prefix + loggingName
    }
    
    private static func bumpInstanceCount(for loggingName: String) -> Int {
        logGlobals.instanceCounts[loggingName] = (logGlobals.instanceCounts[loggingName] ?? 0) + 1
        return logGlobals.instanceCounts[loggingName]!
    }
    
    private var instanceCount: Int!
    
    var vcLoggingName: String {
        return String(describing: type(of: self))
    }
    
    private func logVCL(_ msg: String) {
        if instanceCount == nil {
            instanceCount = LoggingViewController.bumpInstanceCount(for: vcLoggingName)
        }
        print("\(LoggingViewController.logPrefix(for: vcLoggingName))(\(instanceCount))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
