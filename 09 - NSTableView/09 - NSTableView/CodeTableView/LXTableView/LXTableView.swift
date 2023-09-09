//
//  LXTableView.swift
//  09 - NSTableView
//
//  Created by lingxiao on 2023/9/9.
//

import Cocoa

class LXTableView: NSTableView {
    
    /*
     depend on system machinery should associte scrollView manually when create tableview by coding
     */
    
    private(set) lazy var scrollView: NSScrollView = {
        let scrollView = NSScrollView()
        scrollView.backgroundColor = NSColor.white
        scrollView.drawsBackground = false
        scrollView.hasHorizontalScroller = true
        scrollView.hasVerticalScroller = true
        scrollView.autohidesScrollers = true
        return scrollView
    }()
    
    
    var adjustsTableColumnsWidth = true
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func layout() {
        super.layout()
        
        if adjustsTableColumnsWidth == true {
            for column in tableColumns {
                column.width = scrollView.bounds.width/CGFloat(tableColumns.count);
            }
        }
    }
    
    private func setupUI() {
        // setup tableview associate with scroll.document
        scrollView.documentView = self
    }
}
