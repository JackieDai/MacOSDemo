//
//  ViewController.swift
//  05-ScrollView
//
//  Created by lingxiao on 2023/9/6.
// source: https://www.bilibili.com/video/BV1TE411u7wx/?spm_id_from=autoNext&vd_source=17f8d08c05031282edf843345267f96f

import Cocoa

class ViewController: NSViewController {
    
    var myScroll: NSScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        addScrollView()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func btnAction(_ sender: Any) {
        
//        myScroll.scroll(.init(x: 100, y: 100))  不会滚动
        
        // myScroll.contentView.scroll(to: .init(x: 100, y: 100))
        // let rect: NSRect = .init(x: 100, y: 300, width: 200, height: 200)
        // myScroll.contentView.scrollToVisible(rect)
        
        var rect = myScroll.contentView.bounds
        rect.origin.x = rect.origin.x + 20
        myScroll.contentView.bounds = rect
    }
    
    func addScrollView() {
        
        let rect: CGRect = .init(x: 0, y: 0, width: 300, height: 300)
        myScroll = NSScrollView(frame: rect)
        let image = NSImage(named: "deskIcon")
        
        guard let imgSize = image?.size else { return }
        
        let imageRect: CGRect = .init(x: 0, y: 0, width: imgSize.width, height: imgSize.height)
        let imgV = NSImageView(frame: imageRect)
        
        imgV.image = image
        
//        myScroll.hasVerticalScroller = true
//        myScroll.hasHorizontalScroller = true
        myScroll.documentView = imgV
        
        view.addSubview(myScroll)
        
    }
}

