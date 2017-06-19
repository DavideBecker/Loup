//
//  Initializer.swift
//  ColorPicker
//
//  Created by Davide Becker on 11.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class Initializer {
    static func prepareWindows() {
        // Get info about all displays
        let displayCount = DisplayManager.getAmountOfDisplays()
        let activeDisplays = DisplayManager.getActiveDisplays(amountOfDisplays: displayCount)
        
        // Take a screenshot for every display
        let screenshots = ScreenshotManager.takeScreenshots(amount: displayCount, displays: activeDisplays)
        
        // For every display
        for screenshot in screenshots {
            // Create a new window
            let ref = WindowManager.newWindow(display: screenshot)
            
            // Store the reference somewhere persistent
            instances.append(ref)
            
            // Initialize the magnifying glass
            ref.window.controller.initMagnifier()
            ref.window.controller.magnifier.zoomedImage.image = ref.window.controller.magnifier.redrawImage()
            ref.window.controller.magnifier.zoomedImage.frame.size = (ref.window.controller.magnifier.zoomedImage.image?.size)!
        }
        
        MouseManager.track()
        
        colorPickerWindowIsOpen = true
        NSApp.activate(ignoringOtherApps: true)
        
    }
}
