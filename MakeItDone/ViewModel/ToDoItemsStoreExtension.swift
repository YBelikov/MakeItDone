import Foundation

extension ToDoItemsStore {
    func createDevData() {
        self.todoItems = [ToDoItem(id: "1", title: "Tidy up the room", status: .notStarted, dueDate: Date().addingTimeInterval(86400)), ToDoItem(id: "2", title: "Finish assesment for AI course", status: .inProgress, dueDate: Date().addingTimeInterval(90000)), ToDoItem(id: "3", title: "Go to the doctor", status: .done, dueDate: Date().addingTimeInterval(-86400))]
    }
}
