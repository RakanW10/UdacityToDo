//
//  JSONFileManagerCache.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 30/06/2024.
//

import Foundation

final class JSONFileManagerCache: Cache {
    static var shared = JSONFileManagerCache()
    private let cacheFileName = "todos.json"
    private let jsonDecoder: JSONDecoder
    private let jsonEncoder: JSONEncoder
    
    private init() {
        jsonDecoder = JSONDecoder()
        jsonEncoder = JSONEncoder()
    }
    
    func save(todos: [Todo]) {
        let manager = FileManager.default
        
        guard let url = manager.urls(for: .documentDirectory, in: .allDomainsMask).first else {return}
        let filePath = url.appending(path: cacheFileName)
        
        do {
            try manager.createFile(atPath: filePath.path, contents: jsonEncoder.encode(todos))
        } catch {
            print(error)
        }
    }
    
    func load() -> [Todo]? {
        let manager = FileManager.default
        
        guard let url = manager.urls(for: .documentDirectory, in: .allDomainsMask).first else {return nil}
        let filePath = url.appending(path: cacheFileName)
        
        
        guard let data = manager.contents(atPath: filePath.path) else {return nil}
        
        do {
            return try jsonDecoder.decode([Todo].self, from: data)
        } catch {
            return nil
        }
    }
}
