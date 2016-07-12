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

func ganerateData() -> [String] {
    //let numberOfRows = 20
    //let numberOfItemPerRows = 15
    var dataArray = ["A", "B", "C", "D", "E", "F", "G", "H"]
    
    return dataArray
    
}

func ganerateData2() -> [String] {
    var dataArray2 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    return dataArray2
}

extension UIColor {
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}
