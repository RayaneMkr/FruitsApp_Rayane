//
//  FruitViewModel.swift
//  Tp_fruits_RayaneMENKAR
//
//  Created by COURS1 on 20/02/2026.
//

import SwiftUI

// MARK: - Fruit ViewModel
/// ViewModel pour charger et gérer les données des fruits depuis le Plist
class FruitViewModel: ObservableObject {
    @Published var fruits: [Fruit] = []
    
    init() {
        loadFruits()
    }
    
    /// Charge les fruits depuis le fichier FruitData.plist
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
    
    /// Récupère un fruit par son nom
    func getFruit(byTitle title: String) -> Fruit? {
        return fruits.first { $0.title == title }
    }
}
