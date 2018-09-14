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
    
    //var categories = ["Tipsy🍹", "Flirty💋", "Strip👀 ", "Sexual🍆","Deadly drunk☠️"]
    
    init() {
        
        // Standard
        list.append(ActionModel(text: "take 2 sips", category: "Standard"))
        list.append(ActionModel(text: "take 1 sip", category: "Standard"))
        list.append(ActionModel(text: "give 2 sips away", category: "Standard"))
        list.append(ActionModel(text: "give 1 sip away", category: "Standard"))
    }
}
