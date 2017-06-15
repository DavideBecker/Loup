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
        let displayCount = DisplayManager.getAmountOfDisplays()
        let activeDisplays = DisplayManager.getActiveDisplays(amountOfDisplays: displayCount)
        
        let screenshots = ScreenshotManager.takeScreenshots(amount: displayCount, displays: activeDisplays)
        
        let ref = WindowManager.newWindow(display: screenshots[0])
        
        instances.append(ref)
//        references.append(ref)
        
        NSApp.activate(ignoringOtherApps: true)
    }
}
