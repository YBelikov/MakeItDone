import Foundation

struct ToDoItemsStore {
    init() {
#if DEBUG
    createDevData()
#endif
    }
    var todoItems: [ToDoItem] = [ToDoItem]()
}


