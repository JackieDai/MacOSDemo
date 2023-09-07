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
        let vc: NSViewController
        let title: String
        switch sender.tag {
        case 0:
            vc = NSViewIntroController()
            title = "NSView Introductions"
        case 1:
            vc = NSCellIntroController()
            title = "NSCell Introductions"
        default:
            return
        }
        
        let windowCtrl = MyWindowController(contentViewController: vc, windowTitle: title)
        windowCtrl.showWindow(self)
        windowCtrl.window?.center()
//        windowCtrl.window?.orderFront(nil)
    }
    
}


extension ViewController {
    func introNSView() {
        
    }
}
