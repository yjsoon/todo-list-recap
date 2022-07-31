//
//  TodoManager.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    
    @Published var todoItems: [TodoItem] = [] {
        didSet {
            save()
        }
    }
    
    var undoneTodos: [TodoItem] {
        todoItems.filter { $0.isDone == false }
    }
    
    var doneTodos: [TodoItem] {
        todoItems.filter { $0.isDone }
    }

    
    let sampleTodoItems: [TodoItem] =  [
        TodoItem(title: "Walk the cat"),
        TodoItem(title: "Feed the cows"),
        TodoItem(title: "Scam the class", isDone: true),
    ]
    
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodoItems = try? propertyListEncoder.encode(todoItems)
        try? encodedTodoItems?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalTodoItems: [TodoItem]!
        
        if let retrievedTodoItemData = try? Data(contentsOf: archiveURL),
            let decodedTodoItems = try? propertyListDecoder.decode([TodoItem].self, from: retrievedTodoItemData) {
                finalTodoItems = decodedTodoItems
        } else {
            finalTodoItems = sampleTodoItems
        }
        
        todoItems = finalTodoItems
    
    }
}
