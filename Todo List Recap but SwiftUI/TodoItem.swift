//
//  TodoItem.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    
    var id = UUID()
    var title: String
    var isDone = false
    
}

