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
            Form {
                Section("Not done") {
                    TodoListDoneOrNotView(todoManager: todoManager, showDone: false)
                }
                Section("Done") {
                    TodoListDoneOrNotView(todoManager: todoManager, showDone: true)
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

struct TodoListDoneOrNotView: View {
    
    @ObservedObject var todoManager: TodoManager
    var showDone: Bool
    
    var body: some View {
        // or ForEach on .filter {$0.wrappedValue.isDone == showDone}
        ForEach($todoManager.todoItems ) { $todoItem in
            if showDone == todoItem.isDone {
                NavigationLink(destination: TodoDetailView(todoItem: $todoItem)) {
                    HStack {
                        Image(systemName: todoItem.isDone ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                withAnimation {
                                    todoItem.isDone.toggle()
                                }
                            }
                        Text(todoItem.title)
                    }
                }
            }
        }
    }
}
