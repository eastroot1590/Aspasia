//
//  Catalog.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import Foundation

/// 운동 메인화면에 노출하는 카탈로그 리스트 데이터
struct Catalog {
    /// 제목
    let title: String
    /// 운동
    let workouts: [Workout]
    
    init(_ title: String, workouts: [Workout]) {
        self.title = title
        self.workouts = workouts
    }
}
