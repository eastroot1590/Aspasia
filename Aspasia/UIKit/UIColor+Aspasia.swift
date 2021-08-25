//
//  UIColor+Aspasia.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/24.
//

import UIKit

extension UIColor {
    var light: UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(red: min(red + 0.1, 1), green: min(green + 0.1, 1), blue: min(blue + 0.1, 1), alpha: alpha)
    }
    
    var dark: UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return UIColor(red: max(red - 0.1, 0), green: max(green - 0.1, 0), blue: max(blue - 0.1, 0), alpha: alpha)
    }
    
    convenience init?(code: String) {
        guard let colorCode = code.colorCode,
              let red = CGFloat(colorCode.substring(from: 0, by: 2), radix: 16),
              let green = CGFloat(colorCode.substring(from: 2, by: 2), radix: 16),
              let blue = CGFloat(colorCode.substring(from: 4, by: 2), radix: 16) else {
            return nil
        }

        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
