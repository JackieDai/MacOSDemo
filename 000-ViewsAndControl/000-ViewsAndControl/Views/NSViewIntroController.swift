//
//  NSViewIntroController.swift
//  000-ViewAndControllers
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa
/*
 if you want to set view backgroundColor, should set `view.wantsLayer == true`
 */

class NSViewIntroController: BaseViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let label = NSTextField(labelWithString: "Hello, this sample is coresponse to AppDelegate")
        view.addSubview(label)
        label.textColor = .blue
        label.wantsLayer = true
        label.layer?.backgroundColor = NSColor.red.cgColor
        label.frame = .init(x: 100, y: 100, width: 300, height: 100)
        
        view.layer?.backgroundColor = NSColor.cyan.cgColor
        
    }
    
    
}
