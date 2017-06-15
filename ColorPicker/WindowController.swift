//
//  File.swift
//  ColorPicker
//
//  Created by Davide Becker on 14.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    var magnifier: Magnifier = Magnifier()
    
    func initMagnifier() {
        self.contentViewController?.view.addSubview(self.magnifier.view)
    }
    
}
