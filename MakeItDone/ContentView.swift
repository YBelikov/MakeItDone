

import SwiftUI

struct ContentView: View {
    var body: some View {
        ToDoItemsList().environmentObject(ToDoItemsStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ToDoItemsStore())
    }
}
