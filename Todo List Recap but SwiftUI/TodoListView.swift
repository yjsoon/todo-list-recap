//
//  TodoListView.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todoManager.todoItems) { $todoItem in
                    NavigationLink(destination: TodoDetailView(todoItem: $todoItem)) {
                        HStack {
                            Image(systemName: todoItem.isDone ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todoItem.isDone.toggle()
                                }
                            Text(todoItem.title)
                        }
                    }
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoManager: TodoManager())
    }
}
