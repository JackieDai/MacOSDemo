//
//  ViewController.swift
//  14 - NSCollectionView
//
//  Created by lingxiao on 2023/9/19.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var collectview: NSCollectionView!
    
    @IBOutlet weak var addBtn: NSButton!
    
    var dataSource: [CollectionViewItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func addNewItem(_ sender: Any) {
        let item = CollectionViewItem()
        dataSource.append(item)
        collectview.reloadData()
    }
    
}


extension ViewController: NSCollectionViewDelegate {
    
    
}

extension ViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = dataSource[indexPath.item]
        return item
    }
    
    
}
