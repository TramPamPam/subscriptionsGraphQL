//
//  ContentView.swift
//  SubscriptionGraphQL
//
//  Created by Oleksandr on 10.04.2021.
//

import SwiftUI

extension ToDoDetail: Identifiable {
 
}

struct ContentView: View {

    @State var rows: [ToDoDetail] = []

    let network = Network.shared

    var body: some View {
        NavigationView {
            List(rows) {
                ToDoRowView(todoItem: $0)
            }
            .padding()
            .navigationTitle("ToDos:")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        network.addNew()
                    }) {
                        Image(systemName: "pencil")
                    }
            )
        }
        .onAppear(perform: {
            network.subscribe()
            network.callback = {
                self.rows = $0
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
