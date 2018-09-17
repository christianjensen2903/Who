//
//  WinnerVC.swift
//  Who
//
//  Created by Christian Jensen on 02/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import UIKit

class WinnerVC: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var andTheWinnerIsText: AndTheWinnerIsText!
    
    var winnerName = ""
    var questionAction = ""
    
    var playersArray = [String]()
    var categories = [CategoryModel]()
    var howDrunk = ""
    
    let allActions = ActionBank()
    var actions = [ActionModel]()
    lazy var randomNumber = Int(arc4random_uniform(UInt32(actions.count)))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colorOne: Colors.dustyPink, colorTwo: Colors.pink)
        andTheWinnerIsText.isEnabled = false
        
        filterQuestions()
        
        actionLabel.text = questionAction + actions[randomNumber].actionText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        winnerLabel.text = winnerName
    }
    
    // Select questions selected for the game
    func filterQuestions() {
        
        actions = allActions.list.filter { return $0.actionCategory == howDrunk}
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "questionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "questionSegue" {
            if let destinationVC = segue.destination as? QuestionVC {
                destinationVC.playersArray = playersArray
                destinationVC.howDrunk = howDrunk
                destinationVC.categories = categories
            }
        }
    }
    
    

}
