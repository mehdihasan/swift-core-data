//
//  ViewController.swift
//  Core Data Prac
//
//  Created by Mehdi Hasan on 1/13/17.
//  Copyright © 2017 Mehdi Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [TaskEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // get data
        getData()
        
        // reload table view
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.isimportant {
            cell.textLabel?.text = "😡 \(task.name!)"
        } else {
            cell.textLabel?.text = "👍🏻 \(task.name!)"
        }
        return cell
    }
    
    func getData() {
        let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try viewContext.fetch(TaskEntity.fetchRequest())
        } catch {
            print("Fetching failed")
        }
    }
}

