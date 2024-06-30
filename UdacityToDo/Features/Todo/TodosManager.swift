//
//  TodosManager.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 29/06/2024.
//

import Foundation

class TodosManager {
    static let shared = TodosManager()
    private init() {}
    
    var todos = [Todo]()
    
    func add(_ title: String) {
        todos.append(.init(title: title, isCompleted: false))
    }
    
    // TodosManager is not responsible to print todos in the terminal so it will give all todos back to the caller
    func listTodos() -> [Todo]{ todos }
    
    func toggleCompletion(at index: Int) -> Result<Todo, TodosError> {
        if var todo = todos[safe: index] {
            todo.toggleCompletion()
            return .success(todo)
        }
        else {
            return .failure(.indexNotFound)
        }
    }
    
    func delete(at index: Int) -> Result<Todo, TodosError> {
        if let todo = todos[safe: index] {
            todos.removeAll{$0.id == todo.id }
            return .success(todo)
        }
        else {
            return .failure(.indexNotFound)
        }
    }
}
 
//TODO: Cache
extension TodosManager {
//    func save(todos: [Todo]) -> Bool{}
//    func load() -> [Todo]?
}
