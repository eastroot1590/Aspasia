//
//  WorkoutHomeViewController.swift
//  Aspasia
//
//  Created by 이동근 on 2021/10/20.
//

import UIKit
import CoreData

class WorkoutHomeViewController: UIViewController {
    
    var catalogs: [Catalog] {
        [
            Catalog("오늘의 운동", workouts: []),
            Catalog("추천 운동", workouts: [])
        ]
    }
    var workouts: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "운동"
        
        view.backgroundColor = .black
        
        let catalogTable = UITableView(frame: view.frame, style: .plain)
        catalogTable.backgroundColor = .black
        catalogTable.separatorStyle = .none
        catalogTable.dataSource = self
        catalogTable.delegate = self
        catalogTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(catalogTable)
        NSLayoutConstraint.activate([
            catalogTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            catalogTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            catalogTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            catalogTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // register
        catalogTable.register(CatalogTableCell.self, forCellReuseIdentifier: "catalogCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

extension WorkoutHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catalogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogCell", for: indexPath) as! CatalogTableCell
        
        cell.fatch(catalogs[indexPath.row])
        
        return cell
    }
}
