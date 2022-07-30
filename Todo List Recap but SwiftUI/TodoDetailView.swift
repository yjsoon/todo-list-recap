//
//  TodoDetailView.swift
//  Todo List Recap but SwiftUI
//
//  Created by YJ Soon on 30/7/22.
//

import SwiftUI

struct TodoDetailView: View {
    
    var todoItem: TodoItem
    
    var body: some View {
        Text(todoItem.title)
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todoItem: TodoItem(title: "Sample todo item"))
    }
}
