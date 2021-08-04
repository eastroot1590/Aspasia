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
    var part: String = ""
    
    /// 종목
    var event: String = ""
    
    /// 종목 상세 설명
    var eventDetail: String = ""
    
    /// 목표
    var goal: [WorkoutSet] = []
    
    /// 달성도
    var achive: [WorkoutSet] = []
}
