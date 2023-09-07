//
//  CodeViewCtrl.swift
//  07-NSWindowController
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class CodeViewCtrl: NSViewController {
    
    override func loadView() {
        self.view = NSView(frame: .init(x: 0, y: 0, width: 400, height: 100))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
}
