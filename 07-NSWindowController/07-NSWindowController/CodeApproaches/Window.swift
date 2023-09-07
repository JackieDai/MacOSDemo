//
//  Window.swift
//  07-NSWindowController
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

class Window: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        isMovableByWindowBackground = true
        backgroundColor = .systemCyan
    }
}
