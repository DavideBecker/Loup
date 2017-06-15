//
//  Magnifier.swift
//  ColorPicker
//
//  Created by Davide Becker on 30.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class Magnifier: NSViewController {
    
    var textField: NSTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("magnifier loaded")
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        self.textField = NSTextField()
        self.textField?.setFrameSize(NSSize(width: 128, height: 50))
        self.view.addSubview(self.textField!)
    }
    
}
