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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
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
    }
    
    // This method will update all the views on screen (progress bar, score label, etc)
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
        progressLabel.text = String(questionNumber) + "/13"
        
        scoreLabel.text = "Score: " + String(score)
        
        nextQuestion()
    }

}
