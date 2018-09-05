//
//  BorderButton.swift
//  Who
//
//  Created by Christian Jensen on 30/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation
import UIKit

class StartButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup() {
        setTitleColor(Colors.green, for: .normal)
        backgroundColor = .clear
        titleLabel?.font = UIFont(name: "Georgia", size: 28)
        layer.cornerRadius = frame.size.height/2
        layer.borderWidth = 4.0
        layer.borderColor = Colors.green.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10.0
    }
}
