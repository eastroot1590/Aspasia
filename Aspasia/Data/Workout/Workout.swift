//
//  Workout.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import Foundation

/// 운동 데이터
struct Workout {
    enum Category {
        /// 유산소 운동
        case aerobic
        /// 무산소 운동
        case anaerobic
    }
    
    /// 대분류
    let category: Category
    /// 부위
    let part: String
    /// 종목
    let name: String
    /// 장비
    let equipment: String?
    /// 머신
    let machine: String?
    /// 목표 세트
    let goalSet: [WorkoutSet]
    /// 도달 세트
    var achiveSet: [WorkoutSet] = []
    
    init(_ category: Category, part: String, name: String, equipment: String? = nil, machine: String? = nil, goalSet: [WorkoutSet]) {
        self.category = category
        self.part = part
        self.name = name
        self.equipment = equipment
        self.machine = machine
        self.goalSet = goalSet
    }
}
