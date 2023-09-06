//
//  ViewController.swift
//  Demo
//
//  Created by 代零霄 on 2023/9/5.
//

import Cocoa

class ViewController: NSViewController {
    
    var myWindow: NSWindow!
    

    @IBOutlet weak var testBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NSApplication.shared.keyWindow
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func handleAction(_ sender: Any) {
        createWindow()
    }
    
    
    
}


extension ViewController {
    func createWindow() {
        let frame: CGRect = .init(x: 0, y: 0, width: 400, height: 200)
        let style: NSWindow.StyleMask = [.titled, .closable, .resizable]
        
        myWindow = NSWindow(contentRect: frame, styleMask: style, backing: .buffered, defer: false)
        myWindow.title = "New Create Window"
        myWindow.makeKeyAndOrderFront(self)
        myWindow.center()
        
//        let windowCtrl = myWindow.windowController
        
        addButtonToTitleBar()
        
        setupMyWindowBgColor()
        
        setupWindowTitleImage()
    }
    
    private func addButtonToTitleBar() {
//        let titleView = myWindow.standardWindowButton(.closeButton)?.superview
        guard let titleView = myWindow.standardWindowButton(.closeButton)?.superview,
              let myWindowWidth = myWindow.contentView?.frame.size.width,
              myWindowWidth > 100
        else { return }
        
        let btn = NSButton()
        let x = myWindowWidth - 100
        let frame: CGRect = .init(x: x, y: 0, width: 80, height: 24)
        btn.frame = frame
        btn.title = "Register"
        btn.bezelStyle = .rounded
        titleView.addSubview(btn)
        
    }
    
    private func setupMyWindowBgColor() {
        myWindow.backgroundColor = .cyan
    }
    
    private func setupWindowTitleImage() {
        myWindow.representedURL = URL(string: "WIndowTitle1")
        let image = NSImage(named: NSImage.Name("princess"))
        myWindow.standardWindowButton(.documentIconButton)?.image = image
    }
}
