//
//  ViewController.swift
//  05-ScrollView
//
//  Created by lingxiao on 2023/9/6.
// source: https://www.bilibili.com/video/BV1TE411u7wx/?spm_id_from=autoNext&vd_source=17f8d08c05031282edf843345267f96f

import Cocoa

enum TestType {
    case one
    case two
}

class ViewController: NSViewController {
    
    var myScroll: NSScrollView!
    
    var testType: TestType = .one

    override func viewDidLoad() {
        super.viewDidLoad()

//        testOne()
        testTwo()
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
    
    
}


extension ViewController {
    func testTwo() {
        testType = .two
        myScroll = .init()
        view.addSubview(myScroll)
        myScroll.snp.makeConstraints { make in
            make.left.top.equalTo(50)
            make.bottom.right.equalTo(-50)
        }
        
        myScroll.backgroundColor = NSColor.red
        myScroll.hasHorizontalScroller = true
        myScroll.hasVerticalScroller = true
        
        /*
         
         documentView
         The view the scroll view scrolls within its content view.
         `documentView`（文档视图）：`documentView` 是 `NSScrollView` 的直接子视图，它通常是内容的容器。这个子视图包含了您想要在滚动视图中显示的实际内容，例如文本、图像或自定义视图。`documentView` 可以是任何 `NSView` 的子类，它决定了滚动视图中可滚动内容的大小和外观。

         
         contentView
         The scroll view’s content view, the view that clips the document view.
         contentView（内容视图）：contentView 是 NSScrollView 中的一个子视图，通常是 documentView 的直接父视图。它充当了 documentView 的容器，负责显示 documentView 中可见部分的内容，并将其裁剪为滚动视图的可见区域。contentView 可以是 NSClipView 类的实例。
         
         clipView（剪切视图）：clipView 是 contentView 的子视图，用于限制和裁剪 documentView 的内容，以使其适应 NSScrollView 的可见区域。clipView 是 NSScrollView 内部机制的一部分，通常不需要直接操作它。
         
         
         */
        
        let documentV = NSView(frame: .init(origin: .zero, size: .init(width: 1000, height: 500)))
        documentV.wantsLayer = true
        documentV.layer?.backgroundColor = NSColor.yellow.cgColor
        myScroll.documentView = documentV
        
        
        let image = NSImage(named: "deskIcon")!
        
        
        let imgV = NSImageView(image: image)
        
        documentV.addSubview(imgV)
        imgV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        
    }
}

extension ViewController {
    func testOne() {
        
        testType = .one
        
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

