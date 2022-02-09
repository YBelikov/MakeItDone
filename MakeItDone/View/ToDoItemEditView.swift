import SwiftUI

struct ToDoItemEditView: View {
    
    var todoItem: ToDoItem
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ToDoItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemEditView(todoItem: ToDoItem(id: .init(), title: "Make some stuff", status: .notStarted, dueDate: Date()))
    }
}
