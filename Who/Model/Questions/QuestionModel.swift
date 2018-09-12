//
//  QuestionModel.swift
//  Who
//
//  Created by Christian Jensen on 01/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation

class QuestionModel {
    
    var questionText : String
    var questionCategory : String
    var peopleNumber : Int
    var actionText : String
    
    init(text: String, category: String, numberOfPeople: Int, action: String) {
        
        questionText = text
        questionCategory = category
        peopleNumber = numberOfPeople
        actionText = action
    }
}
