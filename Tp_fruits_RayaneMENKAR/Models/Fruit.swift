import SwiftUI

struct Fruit: Identifiable, Codable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [String]
    var description: String
    var nutrition: [String]
    
    enum CodingKeys: String, CodingKey {
        case title, headline, image, gradientColors, description, nutrition
    }
}
