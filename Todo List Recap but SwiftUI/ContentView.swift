//
//  ContentView.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import SwiftUI

struct ContentView: View {
    
    var todoItems = [
        TodoItem(title: "Walk the cat"),
        TodoItem(title: "Feed the cows"),
        TodoItem(title: "Scam the class"),
    ]
    
    var body: some View {
        List(todoItems) { todoItem in
            Text(todoItem.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
