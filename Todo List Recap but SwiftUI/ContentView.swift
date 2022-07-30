//
//  ContentView.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        TabView {
            TodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
