import SwiftUI

struct ToDoItemEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoItemsStore: ToDoItemsStore
    @State var todoItem: ToDoItem

    var body: some View {
        VStack {
            NavigationView {
                Form() {
                    VStack(alignment: .leading) {
                        TextField("Item title", text: $todoItem.title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Picker("Status", selection: $todoItem.status) {
                            ForEach(ItemStatus.allCases, id: \.self) { itemStatus in
                                Text(itemStatus.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        DatePicker("Due date:", selection: $todoItem.dueDate, displayedComponents: [.date])
                    }
                }
                .navigationTitle(todoItem.id == nil ? "Create new item" : "Edit item")
            }
            Button {
                todoItemsStore.append(item: todoItem)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
            }

//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text(todoItem.id == nil ? "Create new item" : "Edit item")
//                }
//            }
        }
    }
}

struct ToDoItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemEditView( todoItem: ToDoItem(id: "2", title: "Make some stuff", status: .notStarted, dueDate: Date())).environmentObject(ToDoItemsStore())
    }
}
