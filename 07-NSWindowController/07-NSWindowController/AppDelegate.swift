//
//  AppDelegate.swift
//  07-NSWindowController
//
//  Created by lingxiao on 2023/9/7.
//

import Cocoa

/*
 **the form of creating this project is XIB type**
 */

/**
 NOTE:
  - delete the outline window in MainMenu file
  - break the relationship with Appdelefate
  - create your owner custom windowController
 */

@main
class AppDelegate: NSObject, NSApplicationDelegate {


    lazy var mainWindowCtrl = MainWindowController()
    
    lazy var codeWindowCtrl = CodeWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        mainWindowCtrl.showWindow(nil)
        codeWindowCtrl.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

