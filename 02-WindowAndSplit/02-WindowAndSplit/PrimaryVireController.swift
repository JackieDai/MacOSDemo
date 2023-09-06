//
//  PrimaryVireController.swift
//  02-WindowAndSplit
//
//  Created by lingxiao on 2023/9/6.
//

import Cocoa

class PrimaryVireController: NSViewController {
    
    @IBOutlet weak var primaryBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // 设置背景色为红色
        view.wantsLayer = true // 必须启用 wantsLayer 属性
        view.layer?.backgroundColor = NSColor.red.cgColor
                
    }
    
    @IBAction func btnAction(_ sender: Any) {
        print("click primary btn")
    }
    
}
