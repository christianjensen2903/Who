//
//  PlayersVC.swift
//  Who
//
//  Created by Christian Jensen on 12/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import UIKit

class PlayersVC: UIViewController {
    
    var categories = [CategoryModel]()
    var howDrunk = ""
    
    var players = [String]()
    
    let startColor = Colors.green
    let endColor = Colors.darkGreen
    
    var gradient = GradientTableView()

    @IBOutlet weak var tableView: ButtonTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func setLayout() {
        view.setGradientBackground(colorOne: Colors.dustyPink, colorTwo: Colors.pink)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startGameButtonPressed(_ sender: Any) {
        
        if players.count < 3 {
            let alert = UIAlertController(title: "Not enough players",
                                          message: "You need to be at least 3 players to start the game",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok",
                                         style: .default)
            
            alert.addAction(okAction)
            
            present(alert, animated: true)
        } else {
            performSegue(withIdentifier: "startGameSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGameSegue" {
            if let destinationVC = segue.destination as? QuestionVC {
                destinationVC.playersArray = players
                destinationVC.howDrunk = howDrunk
                destinationVC.categories = categories
            }
        }
    }
    
}







extension PlayersVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gradient.setNumberOfRows(rows: (players.count + 1))
        return players.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as! ButtonCell
        
        tableView.separatorStyle = .none
        cell.selectionStyle = .none
        
        if players.count != 0 {
            cell.categoryButton.backgroundColor = gradient.findBackgroundColor(row: indexPath.row, startColor: startColor, endColor: endColor)
        } else {
            cell.categoryButton.backgroundColor = endColor
        }
        
        cell.categoryButton.tag = indexPath.row
        
        if indexPath.row < players.count {
            cell.categoryButton.setTitle(players[indexPath.row], for: .normal)
            cell.plusImage.image = UIImage(named: "arrow")
            cell.categoryButton.isEnabled = false
        } else {
            cell.categoryButton.setTitle("Add new player", for: .normal)
            cell.plusImage.image = UIImage(named: "plusIcon")
            cell.categoryButton.isEnabled = true
            cell.categoryButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        }

        
        return cell
    }
    
    @objc func buttonTapped ( sender: UIButton) {
        
        let alert = UIAlertController(title: "Add new player",
                                      message: "",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Add",
                                       style: .default) {
                                        [unowned self] action in
                                        
                                        guard let textField =
                                            alert.textFields?.first,
                                            let nameToSave = textField.text
                                            else {
                                                return
                                        }
                                        
                                        if self.players.contains(nameToSave) {
                                            
                                            let alert = UIAlertController(title: "Player already exists",
                                                                          message: "",
                                                                          preferredStyle: .alert)
                                            
                                            let okAction = UIAlertAction(title: "Ok",
                                                                           style: .default)
                                            
                                            alert.addAction(okAction)
                                            
                                            self.present(alert, animated: true)
                                        } else if nameToSave == "" {
                                            let alert = UIAlertController(title: "Player have to have a name",
                                                                          message: "",
                                                                          preferredStyle: .alert)
                                            
                                            let okAction = UIAlertAction(title: "Ok",
                                                                         style: .default)

                                            
                                            alert.addAction(okAction)
                                            
                                            self.present(alert, animated: true)
                                        
                                        } else {
                                            self.players.append(nameToSave)
                                            self.tableView.reloadData()
                                        }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField()
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        present(alert, animated: true)
    }

    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let row = editActionsForRowAt.row
        
        if row < players.count {
            let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
                
                self.players.remove(at: row)
                self.tableView.reloadData()
            }
            delete.backgroundColor = Colors.red
            
            return [delete]
        } else {
            return []
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}



