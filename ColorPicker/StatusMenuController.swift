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
