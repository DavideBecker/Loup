//
//  helpers.swift
//  ColorPicker
//
//  Created by Davide Becker on 29.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Foundation


var accessibilityEnabled: Bool = false
var instances: [Instance] = []

// Checks accessibility permissions, and asks for access
public func checkForAccessibilityPermissions() -> Bool{
    //get the value for accesibility
    let checkOptPrompt = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString
    //set the options: false means it wont ask
    //true means it will popup and ask
    let options = [checkOptPrompt: true]
    //translate into boolean value
    let accessEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary?)
    return accessEnabled
}

// Converts rgb to a hex string
func rgbToHex(r: Int, g:Int, b:Int) -> String {
    return String(format:"%2X", Int(r)) + String(format:"%2X", Int(g)) + String(format:"%2X", Int(b))
}
