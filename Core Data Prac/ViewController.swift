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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        getAndReloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.isimportant {
            cell.textLabel?.text = "😡 \(task.name!)"
        } else {
            cell.textLabel?.text = "👍🏻 \(task.name!)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete
        {
            let task = tasks[indexPath.row]
            viewContext.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            getAndReloadData()
        }
    }
    
    func getAndReloadData()
    {
        let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try viewContext.fetch(TaskEntity.fetchRequest())
            
            // reload table view
            tableView.reloadData()
        } catch {
            print("Fetching failed")
        }
    }
}

