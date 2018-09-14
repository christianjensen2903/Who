//
//  ActionBank.swift
//  Who
//
//  Created by Christian Jensen on 02/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation

class ActionBank {
    
    var list = [ActionModel]()
    
    init() {
        
        // A little 🥂
        list.append(ActionModel(text: "take 1 sip", category: "A little 🥂"))
        
        // Drunk 🍷
        list.append(ActionModel(text: "take 2 sips", category: "Drunk 🍷"))
        
        // Very drunk 🍻
        list.append(ActionModel(text: "take 3 sips", category: "Very drunk 🍻"))
        
    }
}
