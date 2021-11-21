//
//  TemplateWorkout.swift
//  Aspasia
//
//  Created by 이동근 on 2021/11/16.
//

import Foundation

struct TemplateWorkout {
    /// 대분류
    var category: WorkoutCategory?
    /// 부위
    var part: WorkoutPart?
    /// 종목
    var name: String?
    /// 장비
    var equipment: String?
    /// 머신
    var machine: String?
    /// 목표 세트
    var goalSet: [WorkoutSet] = []
    
    /// 운동
    var workout: Workout {
        Workout(category!, part: part!, name: name!, equipment: equipment, machine: machine, goalSet: goalSet)
    }
}
