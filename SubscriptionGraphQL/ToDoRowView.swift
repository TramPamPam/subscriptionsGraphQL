//
//  ToDoRowView.swift
//  SubscriptionGraphQL
//
//  Created by Oleksandr on 10.04.2021.
//

import SwiftUI
import Apollo

struct ToDoRowView: View {
    @State var todoItem: ToDoDetail

    var body: some View {
        HStack {
            Text(todoItem.id)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding()
            Text(todoItem.title)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding()
            Toggle(todoItem.description, isOn: $todoItem.completed)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding()
        }

    }
}

struct ToDoRowView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRowView(todoItem: .init(id: .init("2"),
                                    title: "Some",
                                    description: "Desc",
                                    completed: false))
    }
}
