//
//  NSViewIntroController.swift
//  000-ViewAndControllers
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class NSViewIntroController: NSViewController {
    override func loadView() {
        let rect: CGRect = .init(x: 0, y: 0, width: windowWidth, height: windowHeight)

        view = NSView(frame: rect)
        /*
         wantsLayer: A Boolean value indicating whether the view uses a layer as its backing store.
         */
        view.wantsLayer = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let label = NSTextField(labelWithString: "Hello, this sample is coresponse to AppDelegate")
        view.addSubview(label)
        label.textColor = .blue
        label.wantsLayer = true
        label.backgroundColor = .red
        label.frame = view.bounds
        
    }
    
}
