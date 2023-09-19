//
//  XibListController.swift
//  09 - NSTableView
//
//  Created by lingxiao on 2023/9/11.
//

import Cocoa

class XibListController: NSViewController {
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}


extension XibListController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        50
    }
}

extension XibListController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        10
    }
}

