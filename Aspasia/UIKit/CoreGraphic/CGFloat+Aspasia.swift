//
//  CGFloat+Aspasia.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/04.
//

import UIKit

extension CGFloat {
    init?(_ rawValue: String, radix: Int = 10) {
        guard let number = UInt(rawValue, radix: radix) else {
            return nil
        }
        
        self = CGFloat(number)
    }
}
