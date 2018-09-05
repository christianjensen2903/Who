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
    
    let startColor = Colors.green
    let endColor = Colors.darkGreen
    
    var gradient = GradientTableView()
    
    let categories = ActionBank()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        tableView.dataSource = self
        tableView.delegate = self
        
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

extension SettingsVC: ButtonCellDelegate {
    
    func didTapButton(title: String) {
        
    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gradient.setNumberOfRows(rows: categories.extraCategories.count)
        return categories.extraCategories.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
        
        tableView.separatorStyle = .none
        cell.categoryButton.backgroundColor = gradient.findBackgroundColor(row: indexPath.row, startColor: startColor, endColor: endColor)
        cell.selectionStyle = .none
        cell.categoryButton.setTitle(categories.extraCategories[indexPath.row], for: .normal)
        cell.delegate = self
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}



