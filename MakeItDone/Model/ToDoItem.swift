import Foundation
import FirebaseFirestoreSwift
import FirebaseStorage

enum ItemStatus: String, Codable, CaseIterable {
    case notStarted = "Not started"
    case inProgress = "In progress"
    case done = "Done"
}

struct ToDoItem: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var status: ItemStatus
    var dueDate: Date
    
    init() {
        title = ""
        status = .notStarted
        dueDate = Date()
    }
    
    init(id: String, title: String, status: ItemStatus, dueDate: Date) {
        self.id = id
        self.title = title
        self.status = status
        self.dueDate = dueDate
    }
    
}
