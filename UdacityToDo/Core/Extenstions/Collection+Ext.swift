//
//  Collection+Ext.swift
//  UdacityToDo
//
//  Created by Rakan Alotibi on 29/06/2024.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
