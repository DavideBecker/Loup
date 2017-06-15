//
//  ScreenshotManager.swift
//  ColorPicker
//
//  Created by Davide Becker on 11.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class ScreenshotManager {
    static func takeScreenshotOfActiveDisplay(_ display: CGDirectDisplayID) -> CGImage {
        let img = CGDisplayCreateImage(display)!
        return img
    }
    
    static func takeScreenshots(amount: UInt32, displays: UnsafeMutablePointer<CGDirectDisplayID>) -> [Display] {
        var screenshots: [Display] = []
        
        for i in 0...amount - 1 {
            let image = ScreenshotManager.takeScreenshotOfActiveDisplay(displays[Int(i)])
            let screenshot = Screenshot(
                displayID: i,
                image: image,
                rep: NSBitmapImageRep(cgImage: image)
            )
            screenshots.append(Display(screen: NSScreen.main()!, screenshot: screenshot))
        }
        
        return screenshots
    }
}
