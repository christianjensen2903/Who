//
//  settingsVC.swift
//  Who
//
//  Created by Christian Jensen on 31/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    var button = DropDownButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the button
        button = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("Colors", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Button to the View Controller
        self.view.addSubview(button)
        
        //button Constraints
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Set the drop down menu's options
        button.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

protocol dropDownProtocol {
    func dropDownPressed(string : String)
}




