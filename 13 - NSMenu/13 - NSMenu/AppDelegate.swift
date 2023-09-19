//
//  AppDelegate.swift
//  13 - NSMenu
//
//  Created by lingxiao on 2023/9/19.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

//    func applicationDockMenu(_ sender: NSApplication) -> NSMenu? {
//        return nil
//    }

//    func applicationDockMenu(_ sender: NSApplication) -> NSMenu? {
//        let dockMenu = NSMenu(title: "dockMenu")
//        let item1 = NSMenuItem(title: "菜单1", action: #selector(clickDockMenu), keyEquivalent: "")
//        item1.target = self;
//        let item2 = NSMenuItem(title: "菜单2", action: #selector(clickDockMenu), keyEquivalent: "")
//        item2.target = self;
//        let item3 = NSMenuItem(title: "菜单3", action: #selector(clickDockMenu), keyEquivalent: "")
//        item3.target = self;
//        dockMenu .addItem(item1)
//        dockMenu .addItem(item2)
//        dockMenu .addItem(item3)
//        let subMenu = NSMenu(title: "Menu3-subMenu")
//        let item3_1 = NSMenuItem(title: "菜单3-1", action: #selector(clickDockMenu), keyEquivalent: "")
//        item3_1.target = self
//        let item3_2 = NSMenuItem(title: "菜单3-2", action: #selector(clickDockMenu), keyEquivalent: "")
//        item3_2.target = self
//        subMenu .addItem(item3_1)
//        subMenu .addItem(item3_2)
//
//        dockMenu .setSubmenu(subMenu, for: item3)//添加二级目录，可往下一直添加N级目录  //设置后点击"菜单3"无效，但可点击"菜单3-1"、"菜单3-2"
//        return dockMenu
//    }
    
    
}

extension AppDelegate {
    @objc func clickDockMenu(menuItem: NSMenuItem) {
        print("dockMenu clickMenu \(menuItem.title)")
    }
}

