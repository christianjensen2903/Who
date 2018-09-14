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

    func didTapButton(title: String, tag: Int)
}


class ButtonCell: UITableViewCell {
    
    
    var delegate: ButtonCellDelegate?
    
    
    @IBOutlet weak var categoryButton: CategoryButton!
    @IBOutlet weak var isSelectedImage: UIImageView!
    @IBOutlet weak var plusImage: UIImageView!
    
    
    @IBAction func categoryButtonTapped(_ sender: CategoryButton) {
        delegate?.didTapButton(title: (categoryButton.titleLabel?.text)!, tag: sender.tag)
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

