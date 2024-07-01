//
//  Cache.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 30/06/2024.
//

import Foundation

protocol Cache {
    func save(todos: [Todo])
    func load() -> [Todo]?
}
