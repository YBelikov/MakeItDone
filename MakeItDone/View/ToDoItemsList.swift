import SwiftUI

struct ToDoItemsList: View {
    @StateObject var todoItemsStore: ToDoItemsStore
    var body: some View {
        NavigationView {
            List(todoItemsStore.todoItems) { todoItem in
                NavigationLink( destination: ToDoItemEditView(todoItem: todoItem)) {
                    ToDoItemRow(todoItem: todoItem)
                }
            }
        }
        .navigationTitle("Gg")
    }
}

struct ToDoItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemsList(todoItemsStore: ToDoItemsStore())
    }
}
