//
//  CustomView.swift
//  04-View
//
//  Created by lingxiao on 2023/9/6.
//

import Cocoa

class CustomView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
        drawYourSelf()
        drawText()
//        saveCustomViewAsImage()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // if you do not want to config directly with calling caonfigLayer(). you should draw yourself by system trigger draw method
        
        // configLayer()
        setbtns()
    }
    /*
     if true cordinator system is same to iOS
     */
    override var isFlipped: Bool { true }
}

extension CustomView {
    func drawYourSelf() {
        NSColor.blue.setFill()
        let rect = self.bounds
        let path = NSBezierPath()
        path.appendRoundedRect(rect, xRadius: 10, yRadius: 10)
        path.fill()
    }
    
    func drawText() {
        let text: NSString = "Round Text Area"
        let font = NSFont(name: "Palatino-Roman", size: 12) ?? NSFont.systemFont(ofSize: 13)
        
        let attri: [NSAttributedString.Key : Any] = [
            .font: font,
            .foregroundColor: NSColor.cyan,
            .backgroundColor: NSColor.red
        ]
        
        let location: NSPoint = .init(x: 50, y: 50)
        text.draw(at: location, withAttributes: attri)
    }
    
}


extension CustomView {
    func configLayer() {
        // must set true. then can bind with layer. and can custom layer properties
        wantsLayer = true
        self.layer?.backgroundColor = NSColor.red.cgColor
        self.layer?.borderColor = NSColor.blue.cgColor
        self.layer?.borderWidth = 10
        self.layer?.cornerRadius = 20
    }
    
}

extension CustomView {
    func setbtns() {
        let btn = NSButton(title: "Save And Open", target: self, action: #selector(saveCustomViewAsImage))
        self.addSubview(btn)
        btn.wantsLayer = true
        btn.layer?.backgroundColor = NSColor.red.cgColor
        btn.frame = .init(x: 20, y: 0, width: 100, height: 50)
    }
}


extension CustomView {
    // FIXME: @lingxiao this method cause error
    @objc func saveCustomViewAsImage() {
        let image = NSImage(data: dataWithPDF(inside: self.bounds))
        guard let imageData = image?.tiffRepresentation else {
            return
        }
        
        let fileManager = FileManager.default
        
        let path = "/Users/lingxiao/MacOSDemo/04-View"
        fileManager.createFile(atPath: path, contents: imageData, attributes: nil)
        
        /**
         will open previous saved sources
         */
//        let fileUrl = URL(fileURLWithPath: path)
//        NSWorkspace.shared.activateFileViewerSelecting([fileUrl])
    }
    
    
}
