//
//  QuestionContainer.swift
//  Who
//
//  Created by Christian Jensen on 31/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation
import UIKit

class NameButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup() {
        setTitleColor(Colors.midPink, for: .normal)
        backgroundColor = UIColor.white
        titleLabel?.font = UIFont(name: "Georgia", size: 20)
        titleLabel?.numberOfLines = 1
        titleLabel?.minimumScaleFactor = 0.5
        titleLabel?.adjustsFontSizeToFitWidth = true
        layer.cornerRadius = 10
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 6)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.30
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? Colors.green : .white
        }
    }
}
