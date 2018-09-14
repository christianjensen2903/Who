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
    
    var categories = CategoryBank()
    var selectedCategories = [CategoryModel]()

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
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        findSelectedCategories()
        checkForEnoughCategories()
    }
    
    func findSelectedCategories() {
        selectedCategories = categories.list.filter { return $0.selection == true }
    }
    
    func checkForEnoughCategories() {
        
        if selectedCategories.count == 0 {
            
            // Show alert that there isn't selected enough categories
            let alert = UIAlertController(title: "Not enough categories", message: "You must select at least one category to continue", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok, i'll", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        } else if button.titleLabel?.text == "How drunk? 🍺" {
            
            // Show alert that there isn't selected how drunk
            let alert = UIAlertController(title: "Need to choose how drunk", message: "You must select how drunk you want to be", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok, i'll", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            performSegue(withIdentifier: "playersSegue", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playersSegue" {
            if let destinationVC = segue.destination as? PlayersVC {
                destinationVC.categories = selectedCategories
                if let howDrunkString = button.titleLabel?.text {
                    destinationVC.howDrunk = howDrunkString
                }
                
            }
        }
    }
    
    
}







protocol dropDownProtocol {
    func dropDownPressed(string : String)
}

extension SettingsVC: ButtonCellDelegate {

    func didTapButton(title: String, tag: Int) {

    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gradient.setNumberOfRows(rows: categories.list.count)
        return categories.list.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
        
        tableView.separatorStyle = .none
        cell.categoryButton.backgroundColor = gradient.findBackgroundColor(row: indexPath.row, startColor: startColor, endColor: endColor)
        cell.selectionStyle = .none
        cell.categoryButton.setTitle(categories.list[indexPath.row].categoryName, for: .normal)
        cell.categoryButton.tag = indexPath.row
        cell.categoryButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        cell.delegate = self
        
        return cell
    }
    
    @objc func buttonTapped ( sender: UIButton) {
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! ButtonCell
        
        var currentSelection = categories.list[sender.tag].selection
        
        if currentSelection == false {
            currentSelection = true
            cell.isSelectedImage.isHidden = false
        } else {
            currentSelection = false
            cell.isSelectedImage.isHidden = true
        }
        categories.list[sender.tag].selection = currentSelection
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}



