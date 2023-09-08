//
//  ViewController.swift
//  09 - NSTableView
//
//  Created by lingxiao on 2023/9/8.
//

import Cocoa

// https://www.cnblogs.com/gaozhang12345/p/16352388.html

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let view = NSTableView(frame: .init(x: 10, y: 10, width: 300, height: 100))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        self.view.addSubview(view)
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

