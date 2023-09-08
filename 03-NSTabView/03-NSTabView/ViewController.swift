//
//  ViewController.swift
//  03-NSTabView
//
//  Created by lingxiao on 2023/9/8.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func testTwp() {
        
    }
    
    func testOne() {
        let tab = NSTabView(frame: .zero)
        view.addSubview(tab)
        tab.wantsLayer = true
        tab.layer?.backgroundColor = NSColor.systemCyan.cgColor
        
        tab.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.trailing.equalTo(-50)
            make.top.equalTo(30)
            make.bottom.equalTo(50)
        }
        
        tab.delegate = self
        
        let item1 = NSTabViewItem(identifier: "one")
        item1.label = "one"
        let item2 = NSTabViewItem(identifier: "two")
        item2.label = "two"
        tab.addTabViewItem(item1)
        tab.addTabViewItem(item2)
    }


}


extension ViewController: NSTabViewDelegate {
     func tabView(_ tabView: NSTabView, shouldSelect tabViewItem: NSTabViewItem?) -> Bool {
         print(#function)
        return true
    }

     func tabView(_ tabView: NSTabView, willSelect tabViewItem: NSTabViewItem?) {
        print(#function)
    }

     func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?){
        print(#function)
    }

     func tabViewDidChangeNumberOfTabViewItems(_ tabView: NSTabView){
        print(#function)
    }
}
