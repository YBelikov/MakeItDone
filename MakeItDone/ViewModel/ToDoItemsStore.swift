import Foundation

class ToDoItemsStore: ObservableObject {
    init() {
#if DEBUG
    createDevData()
#endif
    }
    @Published var todoItems: [ToDoItem] = [ToDoItem]()
}
