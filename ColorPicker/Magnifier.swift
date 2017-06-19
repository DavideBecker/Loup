//
//  Magnifier.swift
//  ColorPicker
//
//  Created by Davide Becker on 30.05.17.
//  Copyright © 2017 Davide Becker. All rights reserved.
//

import Cocoa

class Magnifier: NSViewController {
    
    let textField = NSTextField()
    let color = NSView()
    let zoomedImage = NSImageView()
    let vibrantBackground = NSVisualEffectView()
    
    let instanceId: Int = 0
    
    var currentColor = NSColor();
    
    let colorBarHeight: CGFloat = 8
    let colorNamesHeight: CGFloat = 56
    let baseMagnifierSize: CGFloat = 256
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("magnifier loaded")
    }
    
    override func loadView() {
        self.view = NSView()
        self.view.wantsLayer                = true
        self.view.layer?.borderWidth        = 1
        self.view.layer?.borderColor        = NSColor.lightGray.cgColor
        
        self.vibrantBackground.frame.size   = NSSize(width: baseMagnifierSize, height: colorNamesHeight)
        self.color.frame.size               = NSSize(width: baseMagnifierSize, height: colorBarHeight)
        self.textField.frame.size           = self.vibrantBackground.frame.size
        
        self.textField.drawsBackground      = false
        self.textField.isBordered           = false
        self.textField.isBezeled            = false
        self.textField.isEditable           = false
        self.textField.isSelectable         = false
        self.textField.font                 = NSFont(name: "Hack", size: 14)
        self.textField.textColor            = NSColor.white
        
        vibrantBackground.blendingMode      = .withinWindow
        vibrantBackground.wantsLayer        = true
        vibrantBackground.material          = .dark
        vibrantBackground.state             = .active
        vibrantBackground.addSubview(self.textField)
        
        self.view.addSubview(self.zoomedImage)
        self.view.addSubview(self.vibrantBackground)
        self.view.addSubview(self.color)
    }
    
    func updatePosition(position pos: NSPoint, color col: NSColor) {
        let inst = instances[self.instanceId]
        let baseMagnifierHeight: CGFloat = baseMagnifierSize + colorBarHeight + colorNamesHeight
        self.currentColor = col
        let scale = inst.display.screenshot.zoomLevel / 2
        
        inst.window.controller.contentViewController?.view.addCursorRect(inst.display.screen.frame, cursor: NSCursor.crosshair())
        
        let oX = baseMagnifierSize / 2
        let oY = baseMagnifierHeight / 2
        
        self.view.frame = NSRect(
            x: pos.x - baseMagnifierSize / 2,
            y: pos.y - baseMagnifierHeight / 2,
            width: baseMagnifierSize,
            height: baseMagnifierHeight
        )
        
        self.zoomedImage.frame.origin = NSPoint(
            x: Int(-pos.x) * inst.display.screenshot.zoomLevel + Int(oX) - scale,
            //0 - Int(pos.x) * inst.display.screenshot.zoomLevel + Int(self.baseMagnifierSize) / 2,
            // Int(-pos.x) * inst.display.screenshot.zoomLevel,
            y: Int(-pos.y) * inst.display.screenshot.zoomLevel + Int(oY) - scale
            //0 - Int(pos.y) * inst.display.screenshot.zoomLevel + Int(baseMagnifierHeight) / 2
            // Int(-pos.y) * inst.display.screenshot.zoomLevel
        )
        inst.window.controller.magnifier.view.layer?.backgroundColor = CGColor.white;
        self.textField.stringValue = " x:\(Int(pos.x)) | y: \(Int(pos.y)) \n \(stringifyRgb(r: col.redComponent, g: col.greenComponent, b: col.blueComponent)) \(rgbToHex(r: col.redComponent, g: col.greenComponent, b: col.blueComponent))"
        self.color.layer?.backgroundColor = col.cgColor
    }
    
    func redrawImage() -> NSImage {
        let screenshot = instances[self.instanceId].display.screenshot
        let screenshotScale = CGRect(
            x: 0,
            y: 0,
            width: screenshot.image.width * screenshot.zoomLevel,
            height: screenshot.image.height * screenshot.zoomLevel
        )
        
        print(screenshotScale)
        
        let bitmapContext = CGContext.init(
            data: nil,
            width: Int(screenshotScale.width),
            height: Int(screenshotScale.height),
            bitsPerComponent: Int(screenshot.image.bitsPerComponent),
            bytesPerRow: Int(screenshot.image.bytesPerRow * screenshot.zoomLevel),
            space: screenshot.image.colorSpace!, //CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: screenshot.image.bitmapInfo.rawValue
        )
        
        bitmapContext?.interpolationQuality = .none;
        bitmapContext?.draw(screenshot.image, in: screenshotScale)
        
        if let context = bitmapContext?.makeImage() {
            return NSImage(cgImage: context, size: screenshotScale.size)
        } else {
            return NSImage(
                cgImage: screenshot.image,
                size: NSSize(width: screenshot.image.width, height: screenshot.image.height)
            )
        }
    }
    
    func getCurrentColor() -> NSColor {
        return self.currentColor
    }
}
