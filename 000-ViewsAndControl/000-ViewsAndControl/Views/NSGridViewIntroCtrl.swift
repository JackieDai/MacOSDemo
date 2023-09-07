//
//  NSGridViewIntroCtrl.swift
//  000-ViewsAndControl
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class NSGridViewIntroCtrl: BaseViewController {
    let textField = NSTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        test2()
        
    }
    
}

extension NSGridViewIntroCtrl {
    private func test2() {
        
        // seprator Box
        let sepratorBox = NSBox()
        sepratorBox.boxType = .separator
        
        // views is the type of 2D Array.
        let views: [[NSView]] = [
            [
                NSTextField(labelWithString: "show scroll bars:"),
                NSButton(radioButtonWithTitle: "Automatically based on mouse or trackpad", target: nil, action: nil)
            ],
            [
                NSGridCell.emptyContentView, // 占位的作用，为了对其
                NSButton(radioButtonWithTitle: "Hello Grid", target: nil, action: nil)
            ],
            [
                NSGridCell.emptyContentView,
                NSButton(radioButtonWithTitle: "你好", target: nil, action: nil)
            ],
            [
                NSTextField(labelWithString: "click in the scroll bar to:"),
                NSButton(radioButtonWithTitle: "jump the next page", target: nil, action: nil)
            ],
            [sepratorBox],
            [
                NSTextField(labelWithString: "--Please Check The Top Alignment:"),
                NSButton(title: "Button", target: nil, action: nil)
            ],
            
        ]
        
        
        
        let gridView = NSGridView(views: views)
        gridView.translatesAutoresizingMaskIntoConstraints = false
        gridView.wantsLayer = true
        gridView.layer?.backgroundColor = NSColor.red.cgColor
        view.addSubview(gridView)
        NSLayoutConstraint.activate([
            gridView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gridView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        
        // 设置列对其方式
        gridView.column(at: 0).xPlacement = .trailing
        // 设置行 间距
        gridView.row(at: 3).topPadding = 20
        
        // if not input the follow codes. the separator line will not span to the whole gridview
        // fetch the seprator row index
        let separatorRow: NSGridRow = gridView.row(at: 4)
        // merge cells through range. in this case, the range.length is the num of columns
        separatorRow.mergeCells(in: .init(location: 0, length: 2))
        // setup padding of margin
        separatorRow.topPadding = 16
        separatorRow.bottomPadding = 16
        
        // setup alignment type. if not set. the alignment between lable and button may unappropriate.
        gridView.rowAlignment = .firstBaseline
    }
}

extension NSGridViewIntroCtrl {
    // FIXME: @lingxiao. there are some issues when add column to gridview. pls check and find the reason
    private func test1() {
        
      
        
        // 创建 NSGridView
        let gridView = NSGridView()
        gridView.translatesAutoresizingMaskIntoConstraints = false
        gridView.columnSpacing = 8
        gridView.rowSpacing = 8
        view.addSubview(gridView)
        gridView.wantsLayer = true
        gridView.layer?.backgroundColor = NSColor.red.cgColor
        
        // 创建标签
        let label = NSTextField(labelWithString: "Name:")
        label.isEditable = false
        label.isBordered = false
        gridView.addRow(with: [label])
        
        // 创建文本字段
        textField.placeholderString = "Enter your name"
        gridView.addRow(with: [textField])
        
        // 创建按钮
        let button = NSButton(title: "Submit", target: self, action: #selector(submitButtonClicked(_:)))
        gridView.addRow(with: [button])
        
        
        //        let testV1 = NSView(frame: .init(x: 0, y: 0, width: 50, height: 50))
        //        testV1.wantsLayer = true
        //        testV1.layer?.backgroundColor = NSColor.yellow.cgColor
        //        gridView.addRow(with: [testV1])
        
        // 约束 NSGridView
        NSLayoutConstraint.activate([
            gridView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gridView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func submitButtonClicked(_ sender: NSButton) {
        // 处理按钮点击事件
        let name = textField.stringValue
        print("Name entered: \(name)")
    }
}
