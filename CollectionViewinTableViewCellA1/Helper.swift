//
//  Helper.swift
//  CollectionViewinTableViewCellA1
//
//  Created by admin on 7/12/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRows = 15
    
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRows).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}
