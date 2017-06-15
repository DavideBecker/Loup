//
//  KeystrokeManager.swift
//  ColorPicker
//
//  Created by Davide Becker on 15.06.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class KeystrokeManager {
    static func addListener() {
        // Listen for global key strokes
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { (event) in
            handle(event)
        }
    }
    
    // Handler for keystrokes
    static func handle(_ event: NSEvent) {
        //event.modifierFlags.contains(.command)
        print(event)
    }
}
