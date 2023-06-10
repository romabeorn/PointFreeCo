import Foundation

final class Storage {
    
    // MARK: - Singletone
    
    static let shared = Storage()
    
    // MARK: - Init

    private init() {}
    
    // MARK: - Internal
    
    var appState: AppState {
        get {
            guard let data = UserDefaults.standard.data(forKey: "appstate") else {
                return AppState()
            }
            let jsonDecoder = JSONDecoder()
            let appState = try! jsonDecoder.decode(AppState.self, from: data)
            return appState
        }
        set {
            let jsonEncoder = JSONEncoder()
            let data = try! jsonEncoder.encode(newValue)
            UserDefaults.standard.set(data, forKey: "appstate")
        }
    }
}
