//
//  CodeListController.swift
//  09 - NSTableView
//
//  Created by lingxiao on 2023/9/9.
//

import Cocoa

/*
 因为系统机制导致，纯代码实现滚动视图的时候必须自己实现 scrollView
 
 https://www.jianshu.com/p/50f77e8eccf5
 
 https://www.jianshu.com/c/299375a4887f
 */

class CodeListController: NSViewController {
    
    override func loadView() {
        let view = NSView(frame: .init(x: 10, y: 10, width: 400, height: 300))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        self.view = view
    }
    
    private lazy var tableView: NSTableView = {
        let tmpTableView = NSTableView()
        tmpTableView.delegate = self
        tmpTableView.dataSource = self
        tmpTableView.allowsColumnSelection = true
        return tmpTableView
    }()
    
    var dataSource = Array<Any>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据源
        for i in 0..<10{
            let dataStr = "第\(i+1)条数据"
            dataSource.append(dataStr)
        }
        //初始化ScrollView用于承载tableView附有滚动效果
        let scrollView = NSScrollView()
        scrollView.hasVerticalScroller = true
        scrollView.frame = CGRect.zero
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        //初始化两个column
        let column1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "test1"))
        column1.width = 200
        column1.minWidth = 200
        column1.maxWidth = 201
        column1.title = "column1"
        let column2 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "test2"))
        column2.width = 200
        column2.minWidth = 200
        column2.maxWidth = 201
        column2.title = "column2"
        column2.isEditable = true
        column2.headerToolTip = "提示"
        column2.isHidden = false
        column2.sortDescriptorPrototype = NSSortDescriptor(key: "sortDescriptorPrototyp", ascending: false)
        //允许自动调整Column的尺寸
        column1.resizingMask = NSTableColumn.ResizingOptions.autoresizingMask
        column2.resizingMask = NSTableColumn.ResizingOptions.autoresizingMask
        tableView.frame = CGRect.zero
        tableView.addTableColumn(column1)
        tableView.addTableColumn(column2)
        scrollView.contentView.documentView = tableView
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
        }
    }
}

extension CodeListController: NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        10
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        40
    }
}

extension CodeListController: NSTableViewDataSource {
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        var rowStr = ""
        if tableColumn?.identifier == .init(rawValue: "test1") {
            rowStr += "第1列,"
        } else if tableColumn?.identifier == .init(rawValue: "test1") {
            rowStr += "第2列,"
        }
        rowStr += (dataSource[row] as! String)
        return rowStr
    }

}
