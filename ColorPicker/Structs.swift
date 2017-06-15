//
//  WindowManager.swift
//  ColorPicker
//
//  Created by Davide Becker on 11.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

// Contains the raw CG image data for the screen and its memory location
struct Screenshot {
    var displayID: CGDirectDisplayID
    var image: CGImage
    var rep: NSBitmapImageRep
}

// Wrapper for the window
struct Window {
    var controller: WindowController
}

// Contains the screen information and an image of it
struct Display {
    var screen: NSScreen
    var screenshot: Screenshot
}

// Contains all of the above structs
struct Instance {
    var window: Window
    var display: Display
}
