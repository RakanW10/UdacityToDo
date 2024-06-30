//
//  App.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 30/06/2024.
//

import Foundation

class App {
    private var currentCommand : Command?
    func startApp(){
        mainLoop: repeat {
            print("What would you like to do? (add, list, toggle, delete, exit):")
            self.currentCommand = Command(rawValue: readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "exit")
            switch currentCommand {
            case .add:
                print("add")
            case .list:
                print("list")
            case .toggle:
                print("toggle")
            case .delete:
                print("delete")
            case .exit:
                fallthrough
            case nil:
                print("👋 Thanks for using Todo CLI! See you next time!")
                break mainLoop
            }
        } while(true)
    }
}

