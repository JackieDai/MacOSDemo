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

extension CodeListController: NSTableViewDataSource {}

// MARK: - Cell Based 的 NSTableView
extension CodeListController {
//    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
//        var rowStr = ""
//        if tableColumn?.identifier == .init(rawValue: "test1") {
//            rowStr += "第1列,"
//        } else if tableColumn?.identifier == .init(rawValue: "test2") {
//            rowStr += "第2列,"
//        }
//        rowStr += (dataSource[row] as! String)
//        return rowStr
//    }
//
//
//    //cell-base的cell展示前调用 可以进行自定制
//    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
//        let tmpCell = cell as! NSTextFieldCell
//        tmpCell.textColor = NSColor.red
//    }
    
    //    func tableView(_ tableView: NSTableView, dataCellFor tableColumn: NSTableColumn?, row: Int) -> NSCell? {
    //        <#code#>
    //    }
}

// MARK: - View Based 的 NSTableView
extension CodeListController {
    //View-base
    //设置某个元素的具体视图
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let key = tableColumn?.identifier
        //根据ID取视图
        var view = tableView.makeView(withIdentifier: .init(rawValue: "cellId"), owner: self)
        if (view==nil) {
            view = NSTextField()
            (view as! NSTextField).isBordered=false
            (view as! NSTextField).isEditable=false
            (view as! NSTextField).backgroundColor = NSColor.clear
            (view as! NSTextField).identifier = .init(rawValue: "cellId");
        }
        
        var rowStr = ""
        if key == .init(rawValue: "test1") {
            rowStr += "第1列,"
        } else if key == .init(rawValue: "test2") {
            rowStr += "第2列,"
        }
        rowStr += (dataSource[row] as! String)
        
        
        (view as! NSTextField).stringValue = rowStr
        return view;
    }
    
    
    //设置每行容器视图
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let tableRowView = TableRow()
        let lineView = NSView()
        lineView.wantsLayer = true
        lineView.layer?.backgroundColor = NSColor.blue.cgColor
        tableRowView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(1)
        }
        return tableRowView
    }
    //当添加行时调用的回调
    func tableView(_ tableView: NSTableView, didAdd rowView: NSTableRowView, forRow row: Int) {
        print("addRow")
    }
    //当移除行时调用的回调
    func tableView(_ tableView: NSTableView, didRemove rowView: NSTableRowView, forRow row: Int) {
        print("removeRow")
    }
}


class TableRow: NSTableRowView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //绘制选中状态的背景
    override func drawSelection(in dirtyRect: NSRect) {
        let selectionRect = NSInsetRect(self.bounds, 5.0, 5.0)
        NSColor.init(calibratedWhite: 72, alpha: 0.6).setStroke()
        NSColor.init(calibratedWhite: 82, alpha: 0.6).setFill()
        let selectionPath = NSBezierPath.init(roundedRect: selectionRect, xRadius: 10, yRadius: 10)
        selectionPath.fill()
        selectionPath.stroke()
    }
    //绘制背景
    override func drawBackground(in dirtyRect: NSRect) {
        super.drawBackground(in: dirtyRect)
        NSColor.green.setFill()
        
//        NSRectFill(dirtyRect)
        let path = NSBezierPath(rect: dirtyRect)
        path.fill()
    }
    
}
