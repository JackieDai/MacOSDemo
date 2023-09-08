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
        
        view.addSubview(stackV)
        
        
    }
    
    func initialzeOneTwo() {
        let views: [NSView] = [
            .init(frame: .init(origin: .zero, size: .init(width: 100, height: 100))),
            .init(frame: .init(origin: .zero, size: .init(width: 50, height: 50))),
        ]
        
        stackV = .init(views: views)
    }
}

