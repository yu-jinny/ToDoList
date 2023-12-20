//
//  ViewController.swift
//  ToDoList
//
//  Created by t2023-m0028 on 12/21/23.
//

import UIKit

struct Todo {
    var title: String
    var isCompleted: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var toDoListTableView: UITableView!
    @IBOutlet weak var addNewListButton: UIButton!
    
    var toDoMemo: [Todo] = [
           Todo(title: "할 일 1", isCompleted: false),
           Todo(title: "할 일 2", isCompleted: false),
           Todo(title: "할 일 3", isCompleted: true)
       ]
       
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTableView.backgroundColor = .yellow
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
    }
    
    @IBAction func addNewListButtonTapped(_ sender: Any) {
        addNewTodo()
          }
          
          func addNewTodo() {
              let newTodo = Todo(title: "", isCompleted: false)
              toDoMemo.append(newTodo)
              
              let indexPath = IndexPath(row: toDoMemo.count - 1, section: 0)
              toDoListTableView.insertRows(at: [indexPath], with: .automatic)
              
              if let cell = toDoListTableView.cellForRow(at: indexPath) {
                  cell.textLabel?.text = newTodo.title
                  cell.accessoryType = newTodo.isCompleted ? .checkmark : .none
              }
          }
          
          func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return toDoMemo.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
              let todo = toDoMemo[indexPath.row]
              
              cell.textLabel?.text = todo.title
                  cell.accessoryType = todo.isCompleted ? .checkmark : .none


              return cell
          }
      }

      extension ViewController: UITextFieldDelegate {
          func textFieldDidEndEditing(_ textField: UITextField) {
              if let text = textField.text, !text.isEmpty {
                  let index = textField.tag
                  toDoMemo[index].title = text
              }
          }
          
          func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              textField.resignFirstResponder()
              return true
          }
      }
