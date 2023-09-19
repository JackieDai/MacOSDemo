//
//  ViewController.swift
//  10 - NSButton
//
//  Created by lingxiao on 2023/9/19.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        testBtn()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController {
    
    
    func testBtn() {
        // 参考链接： https://blog.csdn.net/lovechris00/article/details/83446855
        // https://www.jianshu.com/p/97bcdac3baf5
        let  btn = NSButton.init(frame: .init(x: 100, y: 100, width: 100, height: 45))
        // title property. can setup title for btn
        btn.title = "Btn Title"
        btn.image = NSImage(named: "beatheard")
        
        // target action
        btn.target = self
        btn.action = #selector(btnOnClick)
        
        btn.alternateTitle = "alternateTitle"
        btn.alternateImage = NSImage(named: "ablum")
        btn.state = .on
        
        view.addSubview(btn)
    }
    
    @objc func btnOnClick() {
     print("click BtnTitle")
    }

}
