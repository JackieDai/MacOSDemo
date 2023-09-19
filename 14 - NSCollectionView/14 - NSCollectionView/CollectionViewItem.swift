//
//  CollectionViewItem.swift
//  14 - NSCollectionView
//
//  Created by lingxiao on 2023/9/19.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    @IBOutlet weak var infoLabel: NSTextField!
    
    var test = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.systemCyan.cgColor
    }
    
    
    @IBAction func btnAction(_ sender: NSButton) {
        test = test + 10
        
        infoLabel.stringValue = "InfoLabel == \(test)"
        
    }
    
}
