//
//  ViewController.swift
//  13 - NSMenu
//
//  Created by lingxiao on 2023/9/19.
//

import Cocoa

// 参考链接： https://www.jianshu.com/p/1141bc9a3b2a

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        test01()
        /*
         NSMenu
          - 为NSPopUpButton控件设置新的自定义弹出菜单——[A].含有menu属性(open var menu: NSMenu?)的控件；
          - 添加NSApp对应顶部的菜单栏菜单(mainMenu)
          - 添加顶部的状态栏菜单(NSStatusBar)
          - 添加Dock菜单
          - 用来作为NSEvent事件的菜单
         */
        test03()
    }
    
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController {
    @objc func handleSelectPopBtn(popBtn : NSPopUpButton) {//NSPopUpButton选择
        print("popBtn.indexOfSelectedItem:",popBtn.indexOfSelectedItem)
        
    }

    
    //注意：响应了设置自定义弹出菜单NSMenu的项NSMenuItem对应方法，就不会响应NSPopUpButton选择的对应方法
    @objc func clickThree(item: NSMenuItem) {
        print("clickThree!", "item.title is",item.title)
        
    }
    // MARK: - 为NSPopUpButton控件设置新的自定义弹出菜单——[A].含有menu属性(open var menu: NSMenu?)的控件；

    func test01() {
        
        /*
         let speedPopBtn = NSPopUpButton(frame: NSMakeRect(100.0, 100.0, 100.0, 30.0))
         self.view .addSubview(speedPopBtn)
         //设置背景色（一般不会去设置）
         speedPopBtn.wantsLayer = true
         speedPopBtn.layer?.backgroundColor = NSColor.red.cgColor
         */

        let speedPopBtn = NSPopUpButton(frame: .init(x: 100, y: 100, width: 100, height: 30))
        view.addSubview(speedPopBtn)
        
        speedPopBtn.wantsLayer = true
        speedPopBtn.layer?.backgroundColor = NSColor.red.cgColor
        
        
        //设置数组（所拥有的项）
        let typeArr = ["常速", "2倍速", "4倍速", "8倍速", "16倍速"]
        speedPopBtn .addItems(withTitles: typeArr)
        
        //设置 默认选中项——首项："4倍速"
        speedPopBtn .selectItem(at: 2)
        
        // 设置弹出菜单位置
        speedPopBtn.preferredEdge = .maxX
        
        //添加选择时的响应事件
        speedPopBtn.target = self;
        speedPopBtn.action = #selector(handleSelectPopBtn)
        
        
        // 可以为 NSPopUpButton 设置 NSMenu
        //设置新的自定义弹出菜单
        let menu = NSMenu(title: "Menu")
        menu .insertItem(withTitle: "one", action: nil, keyEquivalent: "", at: 0)   //指定位置插入
        menu .addItem(withTitle: "two", action: nil, keyEquivalent: "")             //末尾添加
        menu .addItem(withTitle: "three", action: #selector(clickThree), keyEquivalent: "")//末尾添加
        speedPopBtn.menu = menu;
    }
}


extension ViewController {
    // MARK: -  添加NSApp对应顶部的菜单栏菜单(mainMenu)
    func test02() {
        //获取NSApp的主目录
        let mainMenu = NSApp.mainMenu
        let itemRoot = NSMenuItem(title: "根菜单项", action: #selector(clickMenu), keyEquivalent: "")
//        itemRoot.title = "Load_TEXT"//设置根目录项的title文字无效
        let rootMenu = NSMenu(title: "RootMenu-根目录")//文字会以根目录的title来显示
        //必须先设置根目录(第一层)——rootMenu、根目录项——itemRoot
        mainMenu? .setSubmenu(rootMenu, for: itemRoot)//添加一级目录(根目录)，可往下一直添加N级目录
        //在末尾添加"根菜单项"
        //mainMenu? .addItem(itemRoot)
        //在指定位置添加"根菜单项"
        mainMenu? .insertItem(itemRoot, at: (0 + 2))
        
        
        
        //添加一级目录项
        let item1 = NSMenuItem(title: "菜单1", action: #selector(clickMenu), keyEquivalent: "")
        item1.target = self;
        let item2 = NSMenuItem(title: "菜单2", action: #selector(clickMenu), keyEquivalent: "")
        item2.target = self;
        let item3 = NSMenuItem(title: "菜单3", action: #selector(clickMenu), keyEquivalent: "")
        item3.target = self;
        rootMenu .addItem(item1)
        rootMenu .addItem(item2)
        rootMenu .addItem(item3)

        let subMenu = NSMenu(title: "Menu3-subMenu")
        rootMenu .setSubmenu(subMenu, for: item3)//添加二级目录——subMenu
        let item3_1 = NSMenuItem(title: "菜单3-1", action: #selector(clickMenu), keyEquivalent: "")
        item3_1.target = self
        let item3_2 = NSMenuItem(title: "菜单3-2", action: #selector(clickMenu), keyEquivalent: "")
        item3_2.target = self
        //添加二级目录项
        subMenu .addItem(item3_1)
        subMenu .addItem(item3_2)
    }
    
    @objc func clickMenu(menuItem: NSMenuItem) {
        print("App clickMenu", menuItem.title)
        
    }
}


extension ViewController {
    // MARK: -  添加顶部的状态栏菜单(NSStatusBar)
    func test03() {
        //为状态栏定义并添加2个项（App是开启状态就会在状态栏上展示出来）
        let stsItem = NSStatusBar .system .statusItem(withLength: 120)//自定义长度
        let img = NSImage(named: "games")
        if #available(macOS 10.14, *) {
            stsItem.button?.image = img
            //stsItem.button?.alternateImage = img//选中时的图片
            stsItem.button?.imageScaling = NSImageScaling.scaleProportionallyUpOrDown
        } else {
            stsItem.image = img
            //stsItem.alternateImage = img//选中时的图片
        }
        stsItem.isVisible = true//是否在状态栏中可见，默认为true

        let stsItem2 = NSStatusBar.system .statusItem(withLength: NSStatusItem.squareLength)//标准的长度
        let img2 = NSImage(named: "beautyFilter")
        if #available(macOS 10.14, *) {
            stsItem2.button?.image = img2
            //stsItem.button?.alternateImage = img2//选中时的图片
            stsItem2.button?.imageScaling = NSImageScaling.scaleProportionallyUpOrDown
        } else {
            stsItem2.image = img2
            //stsItem2.alternateImage = img2//选中时的图片
        }
        stsItem2.isVisible = true

//        //在最后：必须用以下任一方法，加入任何一项NSStatusItem到状态栏（必须调用，才会展示新添加的2个项！）
//        //NSStatusBar .insertValue(stsItem2, inPropertyWithKey: "statusMenu")
        //
//        NSStatusBar .system .insertValue(stsItem2, inPropertyWithKey: "statusMenu")
        
        
        let statusMenu = NSMenu(title: "statusMenu")//添加NSMenu菜单
        statusMenu.minimumWidth = 200
        stsItem2.menu = statusMenu
        statusMenu .insertItem(withTitle: "客户头像", action: #selector(statusBarItemClickMenu), keyEquivalent: "", at: 0)
        statusMenu .insertItem(withTitle: "客户信息", action: #selector(statusBarItemClickMenu), keyEquivalent: "", at: 1)
        statusMenu .insertItem(withTitle: "客户权限", action: #selector(statusBarItemClickMenu), keyEquivalent: "", at: 2)
        

        let item3 = statusMenu.items[0+2] as NSMenuItem  //类型转换
        let subMenu = NSMenu(title: "Menu3-subMenu")
        statusMenu .setSubmenu(subMenu, for: item3)//添加二级目录——subMenu
        let item3_1 = NSMenuItem(title: "菜单3-1", action: #selector(statusBarItemClickMenu), keyEquivalent: "")
        item3_1.target = self
        let item3_2 = NSMenuItem(title: "菜单3-2", action: #selector(statusBarItemClickMenu), keyEquivalent: "")
        item3_2.target = self
        //添加二级目录项
        subMenu .addItem(item3_1)
        subMenu .addItem(item3_2)
        
        
        //在最后：必须用以下任一方法，加入任何一项NSStatusItem到状态栏（必须调用，才会展示新添加的2个项！）
        //NSStatusBar .insertValue(stsItem2, inPropertyWithKey: "statusMenu")
        NSStatusBar .system .insertValue(stsItem2, inPropertyWithKey: "statusMenu")
    }
    
    @objc func statusBarItemClickMenu(menuItem: NSMenuItem) {
        print("statusBar Item clickMenu", menuItem.title)
        
    }
}


extension ViewController {
    func test04() {
       
    }
}
