//
//  SecondaryViewController.swift
//  02-WindowAndSplit
//
//  Created by lingxiao on 2023/9/6.
//

import Cocoa

class SecondaryViewController: NSViewController {

    @IBOutlet weak var secondaryBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func secondaryBtnAction(_ sender: Any) {
        print("secondary")
    }
    
    
}
