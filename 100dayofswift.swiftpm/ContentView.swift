import SwiftUI

struct ContentView: View {
    let ctemp = 2.5
    var ftemp = 2.5 * 9/5 + 32
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("C:\(ctemp) F:\(ftemp)")
        }
    }
}
