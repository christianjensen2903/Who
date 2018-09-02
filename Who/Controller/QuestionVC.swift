//
//  QuestionVC.swift
//  Who
//
//  Created by Christian Jensen on 31/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet weak var question: Question!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var topNameButton: NameButton!
    @IBOutlet weak var middleNameButton: NameButton!
    @IBOutlet weak var buttomNameButton: NameButton!
    
    var playersArray = ["Christian", "Mikkel", "Søren", "Peter", "Mette", "Lotte"]
    lazy var numberOfPlayers = playersArray.count
    var currentPlayer = 1
    
    let allQuestions = QuestionBank()
    var questions = [QuestionModel]()
    lazy var questionNumber = Int(arc4random_uniform(UInt32(questions.count)))
    
    var option1 = 0
    var option2 = 0
    var option3 = 0
    
    let defualt = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterQuestions()
        makeTextAutoSize()
        setLayout()
        
        
        
        // Load players
//        if let players = UserDefaults.standard.array(forKey: "playersArray") as? [String] {
//            playersArray = players
//        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Init layout
    func setLayout() {
        view.setGradientBackground(colorOne: Colors.dustyPink, colorTwo: Colors.pink)
        question.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        question.isUserInteractionEnabled = false
        question.titleLabel?.textAlignment = .center
        progressBar.backgroundColor = Colors.green
        
        // Set question label
        question.setTitle(questions[questionNumber].questionText, for: .normal)
        
        // Set button names
        selectPlayers()
        
    }
    
    // This method will update all the views on screen (progress bar, score label, etc)
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(numberOfPlayers)) * CGFloat(currentPlayer)
        
    }
    
    // Make the button size the text according to the length
    func makeTextAutoSize() {
        topNameButton.titleLabel?.numberOfLines = 1
        topNameButton.titleLabel?.minimumScaleFactor = 0.5
        topNameButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        middleNameButton.titleLabel?.numberOfLines = 1
        middleNameButton.titleLabel?.minimumScaleFactor = 0.5
        middleNameButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        buttomNameButton.titleLabel?.numberOfLines = 1
        buttomNameButton.titleLabel?.minimumScaleFactor = 0.5
        buttomNameButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    // Select questions selected and suited for the game
    func filterQuestions() {
        
        if numberOfPlayers == 3 {
            questions = allQuestions.list.filter { return $0.peopleNumber <= 2}
        } else {
            questions = allQuestions.list
        }
    }
    
    // Select the players for the buttons and assign them to the buttons
    func selectPlayers() {
        
        let playersNeeded = questions[questionNumber].peopleNumber
        var namesUsed = [[String]]()
        
        // loop through all 3 buttons
        var i = 1
        while i <= 3 {
            
            var buttonString = ""
            var playersAvailable = playersArray
            
            // Go through for the number of players needed
            var buttonNames = [String]()
            for j in 1...playersNeeded {
                
                
                
                let randomNumber = Int(arc4random_uniform(UInt32(playersAvailable.count)))
                
                // Add player according to number in string
                if j == 1 {
                    
                    buttonString += playersAvailable[randomNumber]
                    buttonNames.append(playersAvailable[randomNumber])
                    playersAvailable.remove(at: randomNumber)
                } else if j == playersNeeded {
                    
                    buttonString += " & \(playersAvailable[randomNumber])"
                    buttonNames.append(playersAvailable[randomNumber])
                    playersAvailable.remove(at: randomNumber)
                } else {
                    
                    buttonString += ", \(playersAvailable[randomNumber])"
                    buttonNames.append(playersAvailable[randomNumber])
                    playersAvailable.remove(at: randomNumber)
                }
                
            }

            namesUsed.append(buttonNames)
            
            // Set button tittle
            if i == 1 {
                topNameButton.setTitle(buttonString, for: .normal)
                i += 1
            } else if i == 2 {
                if namesUsed[1] != namesUsed[0] {
                    middleNameButton.setTitle(buttonString, for: .normal)
                    i += 1
                } else {
                    namesUsed.remove(at: 1)
                }
                
            } else if i == 3 {
                if namesUsed[2] != namesUsed[0] && namesUsed[2] != namesUsed[1] {
                    buttomNameButton.setTitle(buttonString, for: .normal)
                    i += 1
                } else {
                    namesUsed.remove(at: 2)
                }
            }
        }
    }
    
    
    
    // A nameButton was pressed
    @IBAction func nameButtonPressed(_ sender: AnyObject) {
        
        currentPlayer += 1
        updateUI()
        
        if sender.tag == 1 {
            option1 += 1
        } else if sender.tag == 2 {
            option2 += 1
        } else if sender.tag == 3 {
            option3 += 1
        }
        
        if currentPlayer == numberOfPlayers {
            checkWhoWon()
        }
    }
    
    // Check for who won this round
    func checkWhoWon() {
        let maxVotes = max(max(option1, option2), option3)
        
        let somethingWentWrong = "There went something wrong, couldn't find the winner, please continue"
        
        if option1 == maxVotes {
            
            print ("The winner is\(topNameButton.titleLabel?.text ?? somethingWentWrong)")
        } else if option2 == maxVotes {
            
            print ("The winner is\(middleNameButton.titleLabel?.text ?? somethingWentWrong)")
        } else {
            
            print ("The winner is\(buttomNameButton.titleLabel?.text ?? somethingWentWrong)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    

}
