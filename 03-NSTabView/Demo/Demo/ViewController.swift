//
//  ViewController.swift
//  Demo
//
//  Created by lingxiao on 2023/9/6.
//

import Cocoa
import SnapKit

class ViewController: NSViewController {
    
    lazy var tabView: NSTabView = {
        let tabView = NSTabView(frame: .zero)
        tabView.delegate = self
        tabView.tabPosition = .left
        tabView.tabViewBorderType = .bezel
        return tabView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSTabViewDelegate {
    
}

