//
//  WorkoutSelectPhase.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/04.
//

import Foundation

/// 운동 선택 단계
enum WorkoutSelectPhase {
    case selectWorkoutType
    case selectWorkoutPart
    case selectWorkoutEvent
    case selectWorkoutGoal
    
    func cellReusableIdentifier() -> String? {
        switch self {
        case .selectWorkoutType:
            return "workoutType"
            
        case .selectWorkoutPart:
            return "workoutPart"
            
        case .selectWorkoutEvent:
            return "workoutEvent"
            
        default:
            return nil
        }
    }
}
