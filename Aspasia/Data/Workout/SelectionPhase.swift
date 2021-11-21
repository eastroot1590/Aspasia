//
//  SelectionPhase.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/21.
//

import Foundation

/// 운동 생성 phase
enum SelectionPhase: String {
    case category
    case part
    case name
    case equipment
    case machine
    
    var itemCount: Int {
        switch self {
        case .category:
            return 2
        case .part:
            return 6
        case .name:
            return 1
        case .equipment:
            return 1
        case .machine:
            return 1
        }
    }
    
    var identifier: String {
        return "\(rawValue)Selector"
    }
    
    var description: String {
        switch self {
        case .category:
            return "대분류"
        case .part:
            return "부위"
        case .name:
            return "종목"
        case .equipment:
            return "장비"
        case .machine:
            return "머신"
        }
    }
}
