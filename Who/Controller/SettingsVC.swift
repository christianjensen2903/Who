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
        
        setLayout()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLayout() {
        view.setGradientBackground(colorOne: Colors.dustyPink, colorTwo: Colors.pink)
        
        //Configure the button
        button = DropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("How drunk? 🍺", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Button to the View Controller
        self.view.addSubview(button)
        
        //button Constraints
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        //Set the drop down menu's options
        button.dropView.dropDownOptions = ["A little 🥂", "Drunk 🍷", "Very drunk 🍻"]
    }
    
}

protocol dropDownProtocol {
    func dropDownPressed(string : String)
}





