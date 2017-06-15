//
//  AppDelegate.swift
//  ColorPicker
//
//  Created by Davide Becker on 14.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Check if we have accessibility access, if not ask for permission.
        // Global shortcuts are using accessibility
        accessibilityEnabled = checkForAccessibilityPermissions()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
}
