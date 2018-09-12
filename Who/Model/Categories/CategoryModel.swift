//
//  File.swift
//  Who
//
//  Created by Christian Jensen on 11/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation

class CategoryModel {
    
    var categoryName : String
    var selection : Bool
    
    init(name: String, select: Bool) {
        categoryName = name
        selection = select
    }
}
