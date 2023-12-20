//
//  ViewController.swift
//  ToDoList
//
//  Created by t2023-m0028 on 12/21/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toDoListTableView: UITableView!
    @IBOutlet weak var addNewListButton: UIButton!
    
    var toDoMemo : [String] = ["할 일1", "할 일 2", "할 일 3"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTableView.backgroundColor = .yellow
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
        toDoListTableView.setEditing(true, animated: true)
           
    }
    @IBAction func addNewListButtonTapped(_ sender: Any) {
        toDoMemo.append("")
             let indexPath = IndexPath(row: toDoMemo.count - 1, section: 0)
                     toDoListTableView.insertRows(at: [indexPath], with: .automatic)
        if let cell = toDoListTableView.cellForRow(at: indexPath) as? MyFirstCell{
            cell.textView.becomeFirstResponder()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoMemo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoListTableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = toDoMemo[indexPath.row]
        return cell
    }
}

