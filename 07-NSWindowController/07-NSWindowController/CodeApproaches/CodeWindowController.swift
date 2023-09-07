//
//  CodeWindowController.swift
//  07-NSWindowController
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class CodeWindowController: NSWindowController {
    
    convenience init() {
        // 必须给个 nib 的值，才会调用 初始化 NSWindowController
        self.init(windowNibName: "Fake Nib Name")
    }
    
    override func loadWindow() {
        self.window = Window(contentRect: .init(x: 0, y: 0, width: 400, height: 300), styleMask: [.closable, .resizable], backing: .buffered, defer: true)
        
    }

    override func windowDidLoad() {
        super.windowDidLoad()
    contentViewController = CodeViewCtrl()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
