//
//  WorkoutSet.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import Foundation

/// 운동 세트
protocol WorkoutSet {
    var load: Float { get set }
    var lap: Int { get set }
}
