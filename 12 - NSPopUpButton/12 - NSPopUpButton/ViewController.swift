//
//  ViewController.swift
//  12 - NSPopUpButton
//
//  Created by lingxiao on 2023/9/19.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
         let speedPopBtn = NSPopUpButton(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
         self.view .addSubview(speedPopBtn)
         //设置背景色（一般不会去设置）
         speedPopBtn.wantsLayer = true
         speedPopBtn.layer?.backgroundColor = NSColor.red.cgColor
         */

        let speedPopBtn = NSPopUpButton(frame: .init(x: 100, y: 100, width: 100, height: 30))
        view.addSubview(speedPopBtn)
        
        speedPopBtn.wantsLayer = true
        speedPopBtn.layer?.backgroundColor = NSColor.red.cgColor
        
        
        //设置数组（所拥有的项）
        let typeArr = ["常速", "2倍速", "4倍速", "8倍速", "16倍速"]
        speedPopBtn .addItems(withTitles: typeArr)
        
        //设置 默认选中项——首项："4倍速"
        speedPopBtn .selectItem(at: 2)
        
        // 设置弹出菜单位置
        speedPopBtn.preferredEdge = .maxX
        
        //添加选择时的响应事件
        speedPopBtn.target = self;
        speedPopBtn.action = #selector(handleSelectPopBtn)
        
    }
    
    @objc func handleSelectPopBtn(popBtn : NSPopUpButton) {//NSPopUpButton选择
        print("popBtn.indexOfSelectedItem:",popBtn.indexOfSelectedItem)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

