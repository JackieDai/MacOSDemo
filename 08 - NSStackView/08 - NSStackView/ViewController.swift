//
//  ViewController.swift
//  08 - NSStackView
//
//  Created by lingxiao on 2023/9/8.
//

import Cocoa

/**
 https://www.kodeco.com/macos
 https://www.kodeco.com/1206-os-x-stack-views-with-nsstackview
 */

class ViewController: NSViewController {
    
    var stackV: NSStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        initialzeOne()
        
        initialzeOneTwo()
        
        configStackVProperty()
        
        layoutStackV()
       
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func configStackVProperty() {
        stackV.wantsLayer = true
        stackV.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    func layoutStackV() {
        view.addSubview(stackV)
        stackV.snp.makeConstraints { make in
            make.left.top.equalTo(40)
            make.right.bottom.equalTo(-40)
        }
    }


}

extension ViewController {
    //MARK: - initialzation
    func initialzeOne() {
        
        stackV = NSStackView()
        
        
        
    }
    
    func initialzeOneTwo() {
        
        let v1 = NSView()
        let v2 = NSView()
        v1.wantsLayer = true
        v2.wantsLayer = true
        
        v1.layer?.backgroundColor = NSColor.yellow.cgColor
        v2.layer?.backgroundColor = NSColor.blue.cgColor
        
        let views: [NSView] = [
            v1,
            v2,
        ]
        
        stackV = .init(views: views)
     
        
        v1.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        v2.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        
        
    }
}

