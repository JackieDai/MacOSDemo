//
//  ViewController.swift
//  11 - NSTextField
//
//  Created by lingxiao on 2023/9/19.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        test()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func test() {
        /*
         NSTextField * showLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(100.0, 100.0, 200.0, 20.0)];//文字提示Label
         [self.view addSubview:showLabel];
         showLabel.bordered = NO;
         showLabel.editable = NO; showLabel.enabled = NO;//不可操作，当作Label！
         showLabel.lineBreakMode = NSLineBreakByCharWrapping;//换行模式：字符边界
         showLabel.alignment = NSTextAlignmentCenter; //字体 居中
         showLabel.backgroundColor = [NSColor redColor];
         showLabel.textColor = [NSColor blackColor];      //textColor(字体色)
         showLabel.stringValue = @"qwertyuiopasdfghjklzxcvbnm,./;'[]1234567890-=!@#$^&(*)QWWRRA";
         */
        let showLabel = NSTextField(frame: .init(x: 100.0, y: 100.0, width: 200.0, height: 20.0))
        showLabel.isBordered = false
        showLabel.isEditable = false
        showLabel.lineBreakMode = .byCharWrapping
        showLabel.alignment = .center
        showLabel.backgroundColor = .red
        showLabel.textColor = .black
        let stringContent = "qwertyuiopasdfghjklzxcvbnm,./;'[]1234567890-=!@#$^&(*)QWWRRA"
        showLabel.stringValue = stringContent
        view.addSubview(showLabel)
        
        let height = stringContent.size(fixMaxWidth: 200, font: showLabel.font).height
        if height > showLabel.frame.size.height {//高度超过范围
            var newFrame = showLabel.frame;
            newFrame.size.height = height;//设置为新的height
            showLabel.frame = newFrame;
        }
        
    }

}


extension String {
    /*
     /**
      计算 文字实际所占的尺寸
      
      @param strContent 字符串内容
      @param w 最大宽度
      @param font 字体
      @return 文字实际所占的尺寸
      */
     - (NSSize)sizeForLblContent:(NSString *)strContent fixMaxWidth:(CGFloat)w andFont:(NSFont *)font {
         // 把该属性放到字典中
         NSDictionary *dictAttr = [[NSDictionary alloc] initWithObjectsAndKeys:font,NSFontAttributeName, nil];
         // 通过字符串的计算文字所占尺寸方法获取尺寸
         NSSize size = [strContent boundingRectWithSize:NSMakeSize(w, 0) //文本的Label的尺寸
                                                options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading //文本绘制时的附加选项
                                             attributes:dictAttr //文字的属性
                                                context:nil].size;
         return size;
     }

     */
    
    func size(fixMaxWidth maxWidth: CGFloat, font: NSFont? = NSFont.systemFont(ofSize: NSFont.systemFontSize)) -> NSSize {
        
        guard self.count > 0 else {
            return .zero
        }
        
        guard let font = font else {
            return .zero
        }
        
        let dictAttr: [NSAttributedString.Key: Any] = [.font : font]
        let size = (self as NSString).boundingRect(with: .init(width: maxWidth, height: 0), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: dictAttr, context: nil).size
        
        return size
    }
    
}
