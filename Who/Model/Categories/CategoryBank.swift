//
//  CategoryBank.swift
//  Who
//
//  Created by Christian Jensen on 11/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation

class CategoryBank {
    
    var list = [CategoryModel]()
    
    var categories = ["Tipsy🍹", "Flirty💋", "Strip👀", "Sexual🍆","Deadly drunk☠️"]
    
    init() {
        
        // Standard
        list.append(CategoryModel(name: "Tipsy🍹", select: false))
        list.append(CategoryModel(name: "Flirty💋", select: false))
        list.append(CategoryModel(name: "Strip👀 ", select: false))
        list.append(CategoryModel(name: "Sexual🍆", select: false))
        list.append(CategoryModel(name: "Deadly drunk☠️", select: false))

    }
}
