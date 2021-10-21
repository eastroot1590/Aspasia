//
//  WorkoutHomeViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit

class WorkoutHomeViewController: UIViewController {
    
    var catalogs: [Catalog] = [
        Catalog(category: .todayWorkout, title: "오늘의 운동", workouts: [
            Workout(.anaerobic, part: "가슴", name: "밴치프레스", equipment: "바벨", goalSet: [
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10)
            ]),
            Workout(.anaerobic, part: "하체", name: "스쿼트", equipment: "바벨", goalSet: [
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10),
                WorkoutSet(weight: 60, raps: 10)
            ]),
            Workout(.anaerobic, part: "가슴", name: "해머인클라인", equipment: "바벨", machine: "해머", goalSet: [
                WorkoutSet(weight: 40, raps: 10),
                WorkoutSet(weight: 40, raps: 10),
                WorkoutSet(weight: 40, raps: 10),
                WorkoutSet(weight: 40, raps: 10),
                WorkoutSet(weight: 40, raps: 10)
            ])
        ]),
        Catalog(category: .recommend, title: "추천 운동", workouts: [
            Workout(.anaerobic, part: "가슴", name: "케이블 플라이", machine: "케이블", goalSet: [
                WorkoutSet(weight: 47, raps: 10),
                WorkoutSet(weight: 47, raps: 10),
                WorkoutSet(weight: 47, raps: 10),
                WorkoutSet(weight: 47, raps: 10),
                WorkoutSet(weight: 47, raps: 10)
            ])
        ]),
        Catalog(category: .newWorkout, title: "새로 만들기", workouts: [])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "운동"
        
        view.backgroundColor = .aspasiaPurple
        
        let catalogTable = UITableView(frame: view.frame, style: .plain)
        catalogTable.backgroundColor = nil
        catalogTable.register(WorkoutCatalogCell.self, forCellReuseIdentifier: "catalogCell")
        catalogTable.dataSource = self
        catalogTable.delegate = self
        catalogTable.rowHeight = UITableView.automaticDimension
        catalogTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(catalogTable)
        NSLayoutConstraint.activate([
            catalogTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            catalogTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            catalogTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            catalogTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension WorkoutHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catalogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogCell", for: indexPath) as! WorkoutCatalogCell
        
        cell.fatch(catalogs[indexPath.row])
        
        return cell
    }
}
