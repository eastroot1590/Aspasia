//
//  AspasiaColor.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/04.
//

import UIKit

struct AspasiaColor {
    let rawValue: String
    
    // TODO: init(from: Decoder)로 변경하면서 저장변수로 바꿔야겠다.
    var uiColor: UIColor? {
        guard let colorCode = rawValue.colorCode,
              let red = CGFloat(colorCode.substring(from: 0, by: 2), radix: 16),
              let green = CGFloat(colorCode.substring(from: 2, by: 2), radix: 16),
              let blue = CGFloat(colorCode.substring(from: 4, by: 2), radix: 16) else {
            return nil
        }

        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
