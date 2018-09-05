//
//  ButtonCell.swift
//  Who
//
//  Created by Christian Jensen on 05/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation
import UIKit

protocol ButtonCellDelegate {
    
    func didTapButton(title: String)
}


class ButtonCell: UITableViewCell {
    
    var delegate: ButtonCellDelegate?
    
    @IBOutlet weak var categoryButton: CategoryButton!
    
    @IBAction func categoryButtonTapped(_ sender: CategoryButton) {
        delegate?.didTapButton(title: (categoryButton.titleLabel?.text)!)
    }
    
    
    init(frame: CGRect) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: "ButtonCell")
        setup()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup() {
        
        
        backgroundColor = .clear
    }
}
