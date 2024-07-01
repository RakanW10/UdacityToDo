//
//  App.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 30/06/2024.
//

import Foundation

final class App {
    private enum Command: String{case add, list, toggle, delete, exit}
    private var currentCommand : Command?
    
    func run(){
    mainLoop: repeat {
        print("What would you like to do? (add, list, toggle, delete, exit): ", terminator: "")
        self.currentCommand = Command(rawValue: readUserInput() ?? "exit")
        switch currentCommand {
        case .add:
            add()
        case .list:
            list()
        case .toggle:
            toggle()
        case .delete:
            delete()
        case .exit:
            print("\n👋 Thanks for using Todo CLI! See you next time!", terminator: "\n\n")
            break mainLoop
        case nil:
            print("Please chose only one of (add, list, toggle, delete, exit)", terminator: "\n\n")
        }
    } while(true)
    }
    
    
    
    private func add(){
        var userInput: String?
    addLoop: repeat {
        print("Enter todo title: ", terminator: "")
        userInput = readUserInput()
        if let userInput = userInput, userInput.isNotEmpty {
            TodosManager.shared.add(userInput)
            print("\n📌 Todo added!", terminator: "\n\n")
            break addLoop
        }
        else {
            print("☺️ Todo Title can't be empty.", terminator: "\n\n")
        }
    } while(true)
    }
    
    private func list(){
        let todos = TodosManager.shared.listTodos()
        if todos.isEmpty {
            print("\n😔 You don't have any todos yat.", terminator: "\n\n")
        } else {
            print("\n📝 Your Todos:")
            
            for (index, todo) in zip(todos.indices, todos) {
                print("\(index + 1). \(todo)")
            }
            print()
        }
    }
    
    private func toggle(){
    toggleLoop: repeat {
        list()
        print("Enter the number of the todo to toggle or 0 to exit: ", terminator: "")
        let itemIndex = (readIntegerUserInput() ?? -1) - 1
        if itemIndex == -1 {
            break toggleLoop
        }
        let result = TodosManager.shared.toggleCompletion(at: itemIndex)
        switch result {
        case .success(_):
            print("\n🔁 Todo completion status toggled!", terminator: "\n\n")
            break toggleLoop
        case .failure(let failure):
            print("\n\(failure.rawValue)")
        }
        
    } while(true)
    }
    
    private func delete(){
    deleteLoop: repeat {
        list()
        print("Enter the number of the todo to delete or 0 to exit: ", terminator: "")
        let itemIndex = (readIntegerUserInput() ?? -1) - 1
        if itemIndex == -1 {
            break deleteLoop
        }
        let result = TodosManager.shared.delete(at: itemIndex)
        switch result {
        case .success(_):
            print("\n🗑️ Todo deleted!", terminator: "\n\n")
            break deleteLoop
        case .failure(let failure):
            print("\n\(failure.rawValue)")
        }
        
    } while(true)
    }
    
    private func readUserInput() -> String? {
        readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    private func readIntegerUserInput() -> Int? {
        Int(readUserInput() ?? "")
    }
}

