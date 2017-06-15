//
//  WindowManager.swift
//  ColorPicker
//
//  Created by Davide Becker on 14.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class WindowManager {
    static func newWindow(display: Display) -> Instance {
        
        // Get the display size
        let displaySize = display.screen.frame
        
        // Create the window
        let window = NSWindow(
            contentRect: displaySize,
            styleMask: .borderless,
            backing: .buffered,
            defer: true
        )
        
        // Create the window controller and set its view controller
        let controller = WindowController(window: window)
        controller.contentViewController = ViewController()
        
        // Create an image view for the screenshot
        let imgView = NSImageView(image: NSImage(cgImage: display.screenshot.image, size: displaySize.size))
        imgView.frame = displaySize
        controller.contentViewController?.view.addSubview(imgView)
        
        // Initialize the magnifying glass
        controller.initMagnifier()
        
        // Set some styles for the window
        controller.window?.backgroundColor = NSColor(calibratedHue: 0, saturation: 1.0, brightness: 0, alpha: 0.7)
        controller.window?.setContentSize(displaySize.size)
        controller.window?.makeKeyAndOrderFront(nil)
        
        // Fullscreen options
        let presOptions: NSApplicationPresentationOptions = (
            [
                .hideDock,
                .hideMenuBar,
                .disableAppleMenu,
                .disableProcessSwitching,
                .disableHideApplication,
                .autoHideToolbar,
            ]
        )
        
        // Set the window to fullscreen
        let optionsDictionary = [NSFullScreenModeApplicationPresentationOptions : NSNumber(value: presOptions.rawValue)]
        controller.contentViewController?.view.enterFullScreenMode(NSScreen.main()!, withOptions: optionsDictionary)
        controller.contentViewController?.view.wantsLayer = true
        
        // Return a struct that contains references to all relevant data
        return Instance(window: Window(controller: controller), display: display)
    }
}
