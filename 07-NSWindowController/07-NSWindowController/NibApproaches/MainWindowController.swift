//
//  MainWindowController.swift
//  07-NSWindowController
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class MainWindowController: NSWindowController {
    
//    convenience init() {
//        self.init(windowNibName: "MainWindowController")
//    }
    
    override var windowNibName: NSNib.Name? {
        "MainWindowController"
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        // if set this property. the window content view will be replaced.
        contentViewController = DemoOneController()
    }
    
}
