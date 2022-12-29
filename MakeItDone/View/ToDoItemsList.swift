import SwiftUI

struct ToDoItemsList: View {
    @EnvironmentObject var todoItemsStore: ToDoItemsStore
    @State private var showEditor = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoItemsStore.todoItems) { todoItem in
                    NavigationLink(destination: ToDoItemEditView(todoItem: todoItem)) {
                        ToDoItemRow(todoItem: todoItem)
                    }
                }
                .onDelete(perform: self.deleteItem)
            }
            .onAppear() {
                self.todoItemsStore.loadData()
            }
            .navigationTitle("To do list")
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination: ToDoItemEditView(todoItem: ToDoItem())) {
                            Image(systemName: "plus.circle")
                        }
                }
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet ) {
        todoItemsStore.deleteItems(at: offsets)
    }
}

struct ToDoItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemsList().environmentObject(ToDoItemsStore())
    }
}
