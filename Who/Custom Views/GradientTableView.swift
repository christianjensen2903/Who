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
    
    // MARK: Color management methods
    
    //Specify a starting color and ending color for the gradient, calculates all the colors needed for the table
    //Saves them to the backgroundColors array
    func setupColors(startcolor: UIColor, endcolor: UIColor)
    {
        for i in (0 ..< numberOfRows) {
            if(i==0) {
                backgroundColors.append(startcolor)
            }
            else {
                backgroundColors.append(findBackgroundColor(row: i, startColor: startcolor, endColor: endcolor))
            }
        }
    }
    
    //Specify the starting color and ending color with RGB strings, and calculate all the colors needed for the table
    //Save them to the backgroundColors array
    func setupColorsWithStrings(start: String, end: String)
    {
        let startcolor = UIColorFromRGB(rgbValue: UInt(hexFromString(colorstring: start)))
        let endcolor = UIColorFromRGB(rgbValue: UInt(hexFromString(colorstring: end)))
        
        for i in (0 ..< numberOfRows) {
            if(i==0) {
                backgroundColors.append(startcolor)
            }
            else {
                backgroundColors.append(findBackgroundColor(row: i, startColor: startcolor, endColor: endcolor))
            }
        }
    }
    
    //create a unsigned integer from a string
    func hexFromString(colorstring: String) -> UInt32
    {
        var hexcolor: UInt32 = 0
        let scanner : Scanner = Scanner(string: colorstring)
        scanner.scanHexInt32(&hexcolor)
        return hexcolor
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
            return UIColor.white
        }
        
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func clearBackgroundColors ()
    {
        backgroundColors = []
    }
    
    
}


