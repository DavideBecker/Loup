//
//  MouseManager.swift
//  ColorPicker
//
//  Created by Davide Becker on 16.06.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

var globalMouseTracker: (Any)?
var localMouseTracker: (Any)?

class MouseManager {

    static func update(_ mousePos: NSPoint) {
        //            print(String(format: "%.0f, %.0f", self.mouseLocation.x, self.mouseLocation.y))
        let inst = instances[0]
        let mag = inst.window.controller.magnifier
        let screenshotPos = NSPoint(x: mousePos.x, y: inst.display.screen.frame.height - mousePos.y)
        
        print(mousePos, screenshotPos)
        
        if let col = inst.display.screenshot.rep.colorAt(x: Int(mousePos.x), y: Int(screenshotPos.y)) {
            mag.updatePosition(position: mousePos, color: col)
        }
    }
    
    static func track() {
        localMouseTracker = NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
            self.update(NSEvent.mouseLocation())
            return $0
        }
        
        globalMouseTracker = NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) {_ in
            self.update(NSEvent.mouseLocation())
        }
    }
    
    static func stopTracking() {
        NSEvent.removeMonitor(globalMouseTracker!)
        NSEvent.removeMonitor(localMouseTracker!)
    }
}
