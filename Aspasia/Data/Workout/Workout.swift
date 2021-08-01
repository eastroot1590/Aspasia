//
//  Workout.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import Foundation

/// 운동 데이터
struct Workout {
    /// 부위
    let part: WorkoutPart
    
    let title: String
    let subtitle: String
    
    var cycles: [WorkoutCycle]
}
