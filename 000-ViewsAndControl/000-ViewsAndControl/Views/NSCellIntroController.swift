//
//  NSCellIntroController.swift
//  000-ViewsAndControl
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa
import SnapKit

class NSCellIntroController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        /*
         A mechanism for displaying text or images in a view object without the overhead of a full NSView subclass.
         
         一个在视图对象中显示文本或图像的机制，没有完整NSView子类的开销。
         
         
         */
        
        let imageCell = NSCell(imageCell: .init(named: "princess"))
//        view.addSubview(imageCell)
        
        let control = NSControl(frame: .init(x: 100, y: 100, width: 200, height: 200))
        control.wantsLayer = true
        control.cell = imageCell
        control.layer?.backgroundColor = NSColor.red.cgColor
        view.addSubview(control)
        
//        imageCell.
    }
    
}
