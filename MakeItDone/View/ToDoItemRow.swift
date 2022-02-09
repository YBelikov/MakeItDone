import SwiftUI

struct ToDoItemRow: View {
    private(set) var statusToImage: [ItemStatus : String] = [.inProgress : "minus.circle", .notStarted : "exclamationmark.circle", .done : "checkmark.circle"]
    
    private(set) var statusToColor: [ItemStatus : Color] = [.inProgress : .yellow, .notStarted : .blue, .done : .green]
    
    var todoItem: ToDoItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(todoItem.title)")
                    .font(.headline)
                Text("\(todoItem.dueDate.format(as: "yyyy-MMM-dd"))")
                    .font(.caption)
            }
            Spacer()
            Image(systemName: "\(statusToImage[todoItem.status]!).fill")
                .padding()
                .foregroundColor(statusToColor[todoItem.status]!)
        }
        .padding(.leading)
    }
}

struct ToDoItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemRow(todoItem: ToDoItem(id: .init(), title: "Make some stuff", status: .done, dueDate: Date())).previewLayout(.sizeThatFits)
    }
        
}
