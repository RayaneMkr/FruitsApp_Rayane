import SwiftUI

class FruitViewModel: ObservableObject {
    @Published var fruits: [Fruit] = []
    
    init() {
        loadFruits()
    }
    
    func loadFruits() {
        guard let url = Bundle.main.url(forResource: "FruitData", withExtension: "plist") else {
            print("❌ Impossible de trouver FruitData.plist")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            fruits = try decoder.decode([Fruit].self, from: data)
            print("✅ Chargé \(fruits.count) fruits avec succès")
        } catch {
            print("❌ Erreur de décodage: \(error)")
        }
    }
    
    func getFruit(byTitle title: String) -> Fruit? {
        return fruits.first { $0.title == title }
    }
}
