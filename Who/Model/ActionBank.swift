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
        
        // Standard
        list.append(ActionModel(text: "Take 2 sips", category: "Standard"))
        list.append(ActionModel(text: "Take 1 sip", category: "Standard"))
        list.append(ActionModel(text: "Give 2 sips away", category: "Standard"))
        list.append(ActionModel(text: "Give 1 sip away", category: "Standard"))
    }
}
