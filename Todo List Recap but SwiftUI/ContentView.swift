//
//  ContentView.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoItems = [
        TodoItem(title: "Walk the cat"),
        TodoItem(title: "Feed the cows"),
        TodoItem(title: "Scam the class", isDone: true),
    ]
    
    var body: some View {
        NavigationView {
            List($todoItems) { $todoItem in
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
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
