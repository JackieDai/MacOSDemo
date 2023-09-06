//
//  PrimaryVireController.swift
//  02-WindowAndSplit
//
//  Created by lingxiao on 2023/9/6.
//

import Cocoa

class PrimaryVireController: NSViewController {

    @IBOutlet weak var primaryBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func btnAction(_ sender: Any) {
        print("click primary btn")
    }
    
}
