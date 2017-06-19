//
//  helpers.swift
//  ColorPicker
//
//  Created by Davide Becker on 29.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa


var accessibilityEnabled: Bool = false
var colorPickerWindowIsOpen: Bool = false
var instances: [Instance] = []
let test = false

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

// Allows padding of strings
extension String {
    func padLeft (totalWidth: Int, with: String) -> String {
        let toPad = totalWidth - self.characters.count
        if toPad < 1 { return self }
        return "".padding(toLength: toPad, withPad: with, startingAt: 0) + self
    }
}

// Converts rgb to a hex string
func rgbToHex(r: CGFloat, g:CGFloat, b:CGFloat) -> String {
    return
        "#" + 
        String(format:"%02X", Int(r * 255)) +
        String(format:"%02X", Int(g * 255)) +
        String(format:"%02X", Int(b * 255))
}

func stringifyRgb(r: CGFloat, g:CGFloat, b:CGFloat) -> String {
    return "rgb(" +
        String(describing: Int(r * 255)) + ", " +
        String(describing: Int(g * 255)) + ", " + 
        String(describing: Int(b * 255)) +
    ")"
}
