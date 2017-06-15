//
//  ViewController.swift
//  ColorPicker
//
//  Created by Davide Becker on 29.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view loaded")
    }
    
    override func loadView() {
        self.view = NSView()
    }
}
