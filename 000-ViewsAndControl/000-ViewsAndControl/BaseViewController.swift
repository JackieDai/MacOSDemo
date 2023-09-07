//
//  BaseViewController.swift
//  000-ViewsAndControl
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class BaseViewController: NSViewController {
    override func loadView() {

        view = MyView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
