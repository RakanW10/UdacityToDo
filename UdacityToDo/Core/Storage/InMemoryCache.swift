//
//  InMemoryCache.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 30/06/2024.
//

import Foundation

final class InMemoryCache: Cache {
    static var shared = InMemoryCache()
    private init() {}
    
    private var todos = [Todo]()
    
    func save(todos: [Todo]) {
        self.todos = todos
    }
    
    func load() -> [Todo]? {
        self.todos
    }
}
