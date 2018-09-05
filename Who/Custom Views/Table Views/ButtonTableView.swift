//
//  ButtonTableView.swift
//  Who
//
//  Created by Christian Jensen on 05/09/2018.
//  Copyright © 2018 Christian Jensen. All rights reserved.
//

import Foundation
import UIKit

class ButtonTableView: UITableView {
    
    init(frame: CGRect) {
        super.init(frame: frame, style: UITableViewStyle.plain)
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
