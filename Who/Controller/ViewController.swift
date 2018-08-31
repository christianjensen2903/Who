//
//  ViewController.swift
//  Who
//
//  Created by Christian Jensen on 30/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colorOne: Colors.dustyPink, colorTwo: Colors.pink)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

