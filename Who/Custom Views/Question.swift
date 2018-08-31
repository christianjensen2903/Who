//
//  QuestionLabel.swift
//  Who
//
//  Created by Christian Jensen on 31/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation
import UIKit

class Question: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = Colors.grey
        titleLabel?.font = UIFont(name: "Georgia", size: 20)
        layer.cornerRadius = 10
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10.0
    }
}

