//
//  ViewController.swift
//  000-ViewsAndControl
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func handleAction(_ sender: NSButton) {
        let vc = NSViewIntroController()
        let windowCtrl = MyWindowController(contentViewController: vc, windowTitle: "NSView Introductions")
        windowCtrl.showWindow(self)
//        windowCtrl.window?.center()
//        windowCtrl.window?.orderFront(nil)
    }
    
}

