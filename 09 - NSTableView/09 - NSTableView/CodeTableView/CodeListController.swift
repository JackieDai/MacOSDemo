//
//  CodeListController.swift
//  09 - NSTableView
//
//  Created by lingxiao on 2023/9/9.
//

import Cocoa

class CodeListController: NSViewController {
    
    override func loadView() {
        let view = NSView(frame: .init(x: 10, y: 10, width: 400, height: 300))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
