//
//  TodoStatsView.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import SwiftUI

struct TodoStatsView: View {
    
    @ObservedObject var todoManager: TodoManager
    
    var body: some View {
        VStack {
            Text("You have \(todoManager.todoItems.count) total todos.")
                .padding()
            Text("You have \(todoManager.undoneTodos.count ) todos left to do.")
        }
        
    }
}

struct TodoStatsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoStatsView(todoManager: TodoManager())
    }
}
