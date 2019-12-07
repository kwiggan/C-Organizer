//
//  ToDoAmaViewController.swift
//  C-Organizer
//
//  Created by Amarachi Kalu-Onuma on 12/6/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class ToDoAmaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var todoTableView: UITableView!
    
     var todos: [String] = ["Bring grading worksheet to class", "Give class Article Review homework"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        // makes row height bigger
        todoTableView.rowHeight = 60
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addTodo(_ sender: Any) {
    
    let todoAlert = UIAlertController(title: "Add Todo", message: "Add a new Task", preferredStyle: .alert)
        
        todoAlert.addTextField()
        
        let addTodoAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let newTodo = todoAlert.textFields![0]
            self.todos.append(newTodo.text!)
            self.todoTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        todoAlert.addAction(addTodoAction)
        todoAlert.addAction(cancelAction)
        
        present(todoAlert, animated: true, completion: nil)
        }
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoCell
            
            cell.todoLabel.text = todos[indexPath.row]
            
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = tableView.cellForRow(at: indexPath) as! TodoCell
            
            if cell.isChecked == false {
                cell.checkmarkImage.image = UIImage(named: "checkmark-png-4")
                cell.isChecked = true
            }
            else {
                cell.checkmarkImage.image = nil
                cell.isChecked = false
            }
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                todos.remove(at: indexPath.row)
                todoTableView.reloadData()
            }
        }
    }
    
    
    
