import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ToDoItemsStore: ObservableObject {
    @Published var todoItems: [ToDoItem] = [ToDoItem]()
    private let collectionName = "ToDoItems"
    private let firestore = Firestore.firestore()
    
    public func loadData() {
        firestore.collection(collectionName).getDocuments { snapshot, error in
            if let error = error {
                print("Error during fetching firebase data. Error: \(error.localizedDescription)")
            }
            else {
                if let snapshot = snapshot {
                    self.todoItems = snapshot.documents.map { document in
                        do {
                           return try document.data(as: ToDoItem.self)
                        }
                        catch {
                           return ToDoItem()
                        }
                    }
                }
            }
        }
    }
    
    public func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let itemToDelete = todoItems.remove(at: index)
            if let itemId = itemToDelete.id {
                firestore.collection(collectionName).document(itemId).delete { error in
                    if let error = error {
                        print("Error on removal data from firestore: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    
    public func append(item: ToDoItem) {
        do {
            if let itemId = item.id {
                let itemEncoded: [String : Any] = try Firestore.Encoder().encode(item)
                let _ = firestore.collection(collectionName).document(itemId).setData(itemEncoded, merge: true)
                return
            }
            let _ = try firestore.collection(collectionName).addDocument(from: item)
        }
        catch (let error) {
            print("Error during updating the Firebase database: \(error.localizedDescription)")
        }
    }
}
