import SwiftUI

struct ContentView: View {
    
    @ObservedObject var appState: AppState

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(appState: appState)) {
                    Text("Counter Demo")
                }
                NavigationLink(destination: EmptyView()) {
                    Text("Counter Demo")
                }
                Text("Counter Demo")
            }
            .navigationTitle("State Management")
        }
    }
}

struct CounterView: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { appState.count -= 1 }, label: { Text("-") })
                Text("\(appState.count)")
                Button(action: { appState.count += 1 }, label: { Text("+") })
            }
            Button(action: {}, label: { Text("Is this prime?") })
            Button(action: {}, label: { Text("What is the \(ordinal(appState.count)) prime?") })
        }
        .font(.title)
        .navigationTitle("Counter Demo")
    }
}

private func ordinal(_ n: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .ordinal
    return numberFormatter.string(for: n) ?? ""
    
}
