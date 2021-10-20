//
//  Catalog.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import Foundation

/// 운동 메인화면에 노출하는 카탈로그 리스트 데이터
struct Catalog {
    enum Category {
        /// 오늘의 운동
        case todayWorkout
        /// 추천
        case recommend
        /// 새로 만들기
        case newWorkout
    }
    
    /// 종류
    let category: Category
    /// 제목
    let title: String
    /// 운동
    let workouts: [Workout]
}
