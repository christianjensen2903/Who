//
//  GradientTableView.swift
//  Who
//
//  Created by Christian Jensen on 03/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation
import UIKit

class GradientTableView : UITableView
{
    private var backgroundColors = [UIColor]()
    private var numberOfRows : Int = 10
    
    // MARK: Getters
    
    func getNumberOfRows() -> Int
    {
        return numberOfRows
    }
    
    func getBackgroundColors() -> [UIColor]
    {
        return backgroundColors
    }
    
    func getBackgroundColorAtRow(row: Int) -> UIColor
    {
        return backgroundColors[row]
    }
    
    // MARK: Setters
    
    func setNumberOfRows(rows: Int)
    {
        numberOfRows = rows
    }
    
    
    //newColor is the percentage change for each row multiplied by the distance between the two colors
    //this number is subtracted from the starting color piecewise from red, green, and blue values respectively
    func findBackgroundColor(row: Int, startColor: UIColor, endColor: UIColor) -> UIColor {
        if let startcomponents = startColor.cgColor.components, let endcomponents = endColor.cgColor.components {
            
            let r = (startcomponents[0] - endcomponents[0])
            let g = (startcomponents[1] - endcomponents[1])
            let b = (startcomponents[2] - endcomponents[2])
            let a = (startcomponents[3] - endcomponents[3])
            
            let perchange = CGFloat(row)/CGFloat(numberOfRows-1)
            let rdelta = (perchange * r)
            let gdelta = (perchange * g)
            let bdelta = (perchange * b)
            let adelta = (perchange * a)
            
            let newColor: UIColor = UIColor(red: fabs(startcomponents[0] - rdelta), green: fabs(startcomponents[1] - gdelta), blue: fabs(startcomponents[2] - bdelta), alpha: fabs(startcomponents[3] - adelta))
            return newColor
        } else {
            return UIColor.black
        }
        
    }
    

    func clearBackgroundColors ()
    {
        backgroundColors = []
    }
    
    
}


