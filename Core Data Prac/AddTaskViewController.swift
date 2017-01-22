//
//  AddTaskViewController.swift
//  Core Data Prac
//
//  Created by Mehdi Hasan on 1/22/17.
//  Copyright © 2017 Mehdi Hasan. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isImportant: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTabbed(_ sender: UIButton)
    {
        let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = TaskEntity(context: viewContext)
        task.name = textField.text!
        task.isimportant = isImportant.isOn
        
        // save the data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // go back to the list view
        navigationController!.popViewController(animated: true)
    }
}
