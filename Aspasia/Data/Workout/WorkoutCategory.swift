//
//  WorkoutCategory.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/16.
//

import Foundation
import UIKit

enum WorkoutCategory: Int16 {
    /// 유산소 운동
    case aerobic = 0
    /// 무산소 운동
    case anaerobic = 1
    
    var color: UIColor {
        switch self {
        case .aerobic:
            return UIColor(red: 55/255, green: 125/255, blue: 223/255, alpha: 1)
            
        case .anaerobic:
            return UIColor(red: 230/255, green: 67/255, blue: 67/255, alpha: 1)
            
        }
    }
    
    var description: String {
        switch self {
        case .aerobic:
            return "유산소"
            
        case .anaerobic:
            return "무산소"
        }
    }
}
