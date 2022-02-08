import Foundation
import Firebase
import FirebaseFirestoreSwift

enum ItemStatus: String, Codable {
    case notStarted
    case inProgress
    case done
}

struct ToDoItem: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var status: ItemStatus
    var dueDate: Date
}
