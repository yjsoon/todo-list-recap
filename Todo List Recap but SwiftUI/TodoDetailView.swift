//
//  TodoDetailView.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todoItem: TodoItem
    
    var body: some View {
        Form {
            TextField("Title of todo", text: $todoItem.title)
            Section {
                Button(todoItem.isDone ? "Mark as not done" : "Mark as done") {
                    todoItem.isDone.toggle()
                }
            }
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todoItem: .constant(TodoItem(title: "Sample todo item")))
    }
}
