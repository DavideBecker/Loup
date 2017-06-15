//
//  WindowManager.swift
//  ColorPicker
//
//  Created by Davide Becker on 11.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class DisplayManager {
    static func getAmountOfDisplays() -> UInt32 {
        var displayCount: UInt32 = 0;
        
        let result = CGGetActiveDisplayList(0, nil, &displayCount)
        if (result != CGError.success) {
            print("error: \(result)")
        }
        
        return displayCount
    }
    
    static func getActiveDisplays(amountOfDisplays amount: UInt32) -> UnsafeMutablePointer<CGDirectDisplayID> {
        var displayAmount = amount
        let allocated = Int(amount)
        let activeDisplays = UnsafeMutablePointer<CGDirectDisplayID>.allocate(capacity: allocated)
        let result = CGGetActiveDisplayList(displayAmount, activeDisplays, &displayAmount)
        
        if (result != CGError.success) {
            print("error: \(result)")
        }
        
        return activeDisplays
    }
}
