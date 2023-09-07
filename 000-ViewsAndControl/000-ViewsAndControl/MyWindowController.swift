//
//  MyWindowController.swift
//  000-ViewAndControllers
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

let windowWidth: CGFloat = CGDisplayBounds(CGMainDisplayID()).width - 200
let windowHeight: CGFloat = CGDisplayBounds(CGMainDisplayID()).width - 100

class MyWindowController: NSWindowController {
    convenience init(contentViewController: NSViewController, windowTitle: String) {
        
        let rect: CGRect = .init(x: 0, y: 0, width: windowWidth, height: windowHeight)
        
        let style: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .resizable]
           
        let window = NSWindow(contentRect: rect, styleMask: style, backing: .buffered, defer: false)
        window.title = windowTitle
        
        self.init(window: window)
        
        self.contentViewController = contentViewController
        
        
       }

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}


class MyView: NSView {
    convenience init() {
        let rect: CGRect = .init(x: 0, y: 0, width: windowWidth, height: windowHeight)

        self.init(frame: rect)
        
        /*
         wantsLayer: A Boolean value indicating whether the view uses a layer as its backing store.
         */
        self.wantsLayer = true
    }
    
    override var isFlipped: Bool { true }
}
