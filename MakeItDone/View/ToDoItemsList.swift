//
//  ToDoItemsList.swift
//  makeitdone
//
//  Created by Yuriy Belikov on 07.02.2022.
//

import SwiftUI

struct ToDoItemsList: View {
    @StateObject private var todoItemsStore: ToDoItemsStore
    var body: some View {
        List {
            ForEach
        }
    }
}

struct ToDoItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemsList()
    }
}
