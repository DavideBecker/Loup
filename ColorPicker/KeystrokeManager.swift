//
//  KeystrokeManager.swift
//  ColorPicker
//
//  Created by Davide Becker on 15.06.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

var globalKeystrokeTracker: Any?
var localKeystrokeTracker: Any?

class KeystrokeManager {
    
    // Handler for keystrokes
    static func handle(_ event: NSEvent, local isLocal: Bool = true) {
        //event.modifierFlags.contains(.command)
        print(isLocal, event)
        
        if(
            event.keyCode == 53 &&
            isLocal &&
            colorPickerWindowIsOpen
        ) {
            WindowManager.closeWindows()
        }
        
        if(
            event.modifierFlags.contains(.command) &&
            event.modifierFlags.contains(.control) &&
            event.keyCode == 35 &&
            !colorPickerWindowIsOpen
        ) {
            Initializer.prepareWindows()
        }
        
        if(
            event.modifierFlags.contains(.command) &&
            event.keyCode == 8 &&
            colorPickerWindowIsOpen &&
            isLocal
        ) {
            let c = instances[0].window.controller.magnifier.getCurrentColor()
            let pasteboard = NSPasteboard.general()
            let text = rgbToHex(r: c.redComponent, g: c.greenComponent, b: c.blueComponent)
            pasteboard.clearContents()
            pasteboard.writeObjects([text as NSString])
            WindowManager.closeWindows()
        }
    }
    
    static func registerLocalHandler() {
        localKeystrokeTracker = NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            self.handle($0)
            return $0
        }
    }
    
    static func registerGlobalHandler() {
        globalKeystrokeTracker = NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { event in
            self.handle(event, local: false)
        }
    }
    
    static func removeLocalHandler() {
        NSEvent.removeMonitor(localKeystrokeTracker!)
    }
    
    static func removeGlobalHandler() {
        NSEvent.removeMonitor(globalKeystrokeTracker!)
    }
}
