//
//  ContinueButton.swift
//  Who
//
//  Created by Christian Jensen on 31/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation
import UIKit



class ContinueButton: UIButton {
    
    let gradientLayer = CAGradientLayer()
    let gradientColorOne = Colors.brightGreen
    let gradientColorTwo = Colors.green
    
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
        titleLabel?.font = UIFont(name: "Georgia", size: 28)
        layer.cornerRadius = frame.size.height/2
        layer.borderWidth = 0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10.0
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.colors = [gradientColorOne.cgColor, gradientColorTwo.cgColor]
        gradientLayer.borderColor = layer.borderColor
        gradientLayer.borderWidth = layer.borderWidth
        gradientLayer.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}

