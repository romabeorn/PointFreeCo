import Foundation
import Combine

final class AppState: ObservableObject, Codable {
    
    @Published var count: Int = 0 {
        didSet { Storage.shared.appState = self }
    }
    
    @Published var favouritePrimes: [Int] = [] {
        didSet { Storage.shared.appState = self }
    }
    
    // MARK: - Init
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        favouritePrimes = try container.decode([Int].self, forKey: .favouritePrimes)
    }
    
    // MARK: - Codable
    
    enum CodingKeys: CodingKey {
        case count, favouritePrimes
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
        try container.encode(favouritePrimes, forKey: .favouritePrimes)
    }
}
