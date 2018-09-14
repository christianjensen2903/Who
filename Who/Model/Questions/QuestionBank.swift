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
        
        // Tipsy🍹 questions
        list.append(QuestionModel(text: "Who has to give and receive a body shot?", category: "Flirty💋", numberOfPeople: 2, action: "You has to take and receive a body shot and "))
        
        
        
        // Flirty💋 questions
        list.append(QuestionModel(text: "Who has to give and receive a body shot?", category: "Flirty💋", numberOfPeople: 2, action: "You has to take and receive a body shot and "))
        list.append(QuestionModel(text: "Who has to tell who they think are the hottest person of the opposite sex?", category: "Flirty💋", numberOfPeople: 1, action: "You have to kiss the hottest person on the cheek and "))
        list.append(QuestionModel(text: "Who has to give or receive a body shot?", category: "Flirty💋", numberOfPeople: 2, action: "You has to take or receive a body shot and "))
        list.append(QuestionModel(text: "Who has to give a hickey to one another?", category: "Sexual🍆", numberOfPeople: 2, action: "You have to give a hickey to the other winner and "))
        
        
        
        // Strip👀
        list.append(QuestionModel(text: "Who has to tell who they think are the hottest person of the opposite sex?", category: "Flirty💋", numberOfPeople: 1, action: "You have to kiss that person on the cheek and "))
        
        
        
        // Sexual🍆 questions
        list.append(QuestionModel(text: "Who has to give or receive a hickey?", category: "Sexual🍆", numberOfPeople: 2, action: "You have to give or receive a hickey and "))
        
        
        
        // Deadly drunk☠️ questions
        list.append(QuestionModel(text: "Who has to take a beerbong hanging upside down?", category: "Deadly drunk☠️", numberOfPeople: 1, action: "You have to kiss that person on the cheek and "))
        list.append(QuestionModel(text: "Who has to compete in taking 3 shots against each other in a row?", category: "Deadly drunk☠️", numberOfPeople: 2, action: "The winner can give a shot to another player and "))
        list.append(QuestionModel(text: "Who has to take 2 shots with no hands?", category: "Deadly drunk☠️", numberOfPeople: 3, action: "You have to take 2 shots with no hands and "))
        list.append(QuestionModel(text: "Who has to take 2 sips of a vodka bottle", category: "Deadly drunk☠️", numberOfPeople: 1, action: "You have to take 2 sips of a vodka bottle and "))
        list.append(QuestionModel(text: "Who has to empty their glasses", category: "Deadly drunk☠️", numberOfPeople: 3, action: "You have to empty your glasses and "))
        
        }
    
    
}
