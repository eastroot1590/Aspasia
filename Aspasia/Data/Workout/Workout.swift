//
//  Workout.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import Foundation
import CoreData

/// 운동 데이터
struct Workout {
    /// 대분류
    let category: WorkoutCategory
    /// 부위
    let part: WorkoutPart
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
    
    init(_ category: WorkoutCategory, part: WorkoutPart, name: String, equipment: String? = nil, machine: String? = nil, goalSet: [WorkoutSet]) {
        self.category = category
        self.part = part
        self.name = name
        self.equipment = equipment
        self.machine = machine
        self.goalSet = goalSet
    }
    
    func saveIntoNSManagedObject(_ workoutEntity: WorkoutEntity, context: NSManagedObjectContext) {
        workoutEntity.setValue(category.rawValue, forKey: "category")
        workoutEntity.setValue(part, forKey: "part")
        workoutEntity.setValue(name, forKey: "name")
        workoutEntity.setValue(equipment, forKey: "equipment")
        workoutEntity.setValue(machine, forKey: "machine")
        
        goalSet.forEach { currentSet in
            let entity = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "WorkoutSetEntity", in: context)!, insertInto: context) as! WorkoutSetEntity
            entity.weight = currentSet.weight
            entity.raps = Int16(currentSet.raps)
            
            workoutEntity.addToGoalSet(entity)
        }
        
        achiveSet.forEach { currentSet in
            let entity = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "WorkoutSetEntity", in: context)!, insertInto: context) as! WorkoutSetEntity
            entity.weight = currentSet.weight
            entity.raps = Int16(currentSet.raps)
            
            workoutEntity.addToAchiveSet(entity)
        }
    }
}
