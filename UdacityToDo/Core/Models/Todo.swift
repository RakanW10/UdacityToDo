//
//  Todo.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 29/06/2024.
//

import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID()
    let title: String
    var isCompleted: Bool
    
    mutating func toggleCompletion(){
        self.isCompleted.toggle()
    }
}

extension Todo: CustomStringConvertible {
    var description: String {
        "id: \(id). title: \(title). completed: \(isCompleted ? "✅" : "❌")"
    }
}
