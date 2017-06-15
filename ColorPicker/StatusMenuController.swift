//
//  StatusMenuController.swift
//  ColorPicker
//
//  Created by Davide Becker on 14.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa


class StatusMenuController: NSObject {
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    @IBAction func startButtonClicked(_ sender: NSMenuItem) {
        Initializer.prepareWindows()
        
        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
            //            print(String(format: "%.0f, %.0f", self.mouseLocation.x, self.mouseLocation.y))
            let inst = instances[0]
            let pos = NSEvent.mouseLocation()
            let screenshotPos = NSPoint(x: pos.x, y: inst.display.screen.frame.height - pos.y)
            let col = inst.display.screenshot.rep.colorAt(x: Int(pos.x), y: Int(screenshotPos.y))
            inst.window.controller.magnifier.view.frame = NSRect(x: pos.x, y: pos.y, width: 200, height: 200)
            inst.window.controller.magnifier.view.layer?.backgroundColor = col?.cgColor;
            inst.window.controller.magnifier.textField?.stringValue = "\(Int(pos.x)), \(Int(pos.y))"
            // print(col!)
            return $0
        }
    }
    
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    //var weatherMenuItem: NSMenuItem!
    
    override func awakeFromNib() {
        statusItem.menu = statusMenu
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        //weatherMenuItem = statusMenu.item(withTitle: "Weather")
        //weatherMenuItem.view = weatherView
        //preferencesWindow = PreferencesWindow()
        //preferencesWindow.delegate = self
        
        //updateWeather()
    }
}
