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
    var winner = ""
    
    let defualt = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterQuestions()
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
            
            var firstNamesSorted = [String]()
            var secondNamesSorted = [String]()
            var thirdNamesSorted = [String]()
            
            // Set button tittle
            if i == 1 {
                topNameButton.setTitle(buttonString, for: .normal)
                i += 1
            } else if i == 2 {
                firstNamesSorted = namesUsed[0].sorted()
                secondNamesSorted = namesUsed[1].sorted()
                if secondNamesSorted != firstNamesSorted {
                    middleNameButton.setTitle(buttonString, for: .normal)
                    i += 1
                } else {
                    namesUsed.remove(at: 1)
                }
                
            } else if i == 3 {
                thirdNamesSorted = namesUsed[2].sorted()
                if thirdNamesSorted != firstNamesSorted && thirdNamesSorted != secondNamesSorted {
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
            winner = topNameButton.titleLabel?.text ?? somethingWentWrong
        } else if option2 == maxVotes {
            winner = middleNameButton.titleLabel?.text ?? somethingWentWrong
        } else {
            winner = buttomNameButton.titleLabel?.text ?? somethingWentWrong
        }
        
        performSegue(withIdentifier: "winnerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "winnerSegue" {
            if let destinationVC = segue.destination as? WinnerVC {
                destinationVC.winnerName = winner
            }
        }
    }
    
    func refreshView() {
        
        // Calling the viewDidLoad and viewWillAppear methods to "refresh" the VC and run through the code within the methods themselves
        self.viewDidLoad()
        //self.viewWillAppear(true)
        
    }
}
