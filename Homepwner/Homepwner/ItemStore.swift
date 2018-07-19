//
//  ItemStore.swift
//  Homepwner
//
//  Created by 王靖伟 on 2018/7/19.
//  Copyright © 2018年 JingweiWang. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func crateItem() -> Item {
        let newItem =  Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
    
    //    init() {
    //        for _ in 0..<5 {
    //            crateItem()
    //        }
    //    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
}
