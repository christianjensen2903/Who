//
//  UIView + Extension.swift
//  Who
//
//  Created by Christian Jensen on 30/08/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation

import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        // gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
