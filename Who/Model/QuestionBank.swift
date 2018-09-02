//
//  QuestionBank.swift
//  Who
//
//  Created by Christian Jensen on 01/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [QuestionModel]()
    
    init() {
        
        // Standard questions
        list.append(QuestionModel(text: "Who has to take off their shirt?", category: "Standard", numberOfPeople: 4))
        list.append(QuestionModel(text: "Who has to kiss?", category: "Standard", numberOfPeople : 2))
        list.append(QuestionModel(text: "Who has to do the Eiffel Tower?", category: "Standard", numberOfPeople : 1))
        list.append(QuestionModel(text: "Who has to take a shot?", category: "Standard", numberOfPeople : 3))
    }
    
    
}
