import SwiftUI

struct ContentView: View {
    
    @ObservedObject var appState: AppState

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(appState: appState)) {
                    Text("Counter Demo")
                }
                NavigationLink(destination: FavouritePrimes(appState: appState)) {
                    Text("Favourite Primes")
                }
                Text("Counter Demo")
            }
            .navigationTitle("State Management")
        }
    }
}

struct FavouritePrimes: View {
    
    @ObservedObject var appState: AppState

    var body: some View {
        VStack {
            ForEach(appState.favouritePrimes, id: \.self) { aaa in
                Text("\(aaa)")
            }
        }
        .font(.title)
        .navigationTitle("Favourite Prime")
    }
}

struct CounterView: View {

    @ObservedObject var appState: AppState

    @State var isPresented: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button { appState.count -= 1 } label: {
                    Text("-")
                }
                Text("\(appState.count)").foregroundStyle(
                    Math.isPrime(number: appState.count) ? .green : .red
                )
                Button { appState.count += 1 } label: { Text("+") }
            }
            Button { if Math.isPrime(number: appState.count) { isPresented.toggle() } } label: {
                Text("Is this prime?")
            }
            Button {} label: {
                Text("What is the \(ordinal(appState.count)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter Demo")
        .sheet(isPresented: $isPresented) {
            VStack {
                if appState.favouritePrimes.contains(appState.count) {
                    Button { appState.favouritePrimes.removeAll { $0 == appState.count } } label: {
                        Text("Remove favourite prime")
                    }
                } else {
                    Button { appState.favouritePrimes.append(appState.count) } label: {
                        Text("Add favourite prime")
                    }
                }
            }
        }
    }
}

private func ordinal(_ n: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .ordinal
    return numberFormatter.string(for: n) ?? ""
}
