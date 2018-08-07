//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Adilkhan khassanov on 7/29/18.
//  Copyright © 2018 Open Technologies Group. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var userDefaults = UserDefaults.standard
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var newItem = Item()
        newItem.title = "Contact Chapito"
        itemArray.append(newItem)
        
        if let items = userDefaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - Add new items
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new task", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in

            var newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.userDefaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new ToDo"
            
            textField = alertTextField
            
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

