import Foundation

extension ToDoItemsStore {
    mutating func createDevData() {
        todoItems = [ToDoItem(id: .init(), title: "Tidy up the room", status: .notStarted, dueDate: Date().addingTimeInterval(86400)), ToDoItem(id: .init(), title: "Finish assesment for AI course", status: .inProgress, dueDate: Date().addingTimeInterval(90000)), ToDoItem(id: .init(), title: "Go to the doctor", status: .done, dueDate: Date().addingTimeInterval(-86400))]
    }
}
