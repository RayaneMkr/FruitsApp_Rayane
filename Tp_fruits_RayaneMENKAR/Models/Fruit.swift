//
//  Fruit.swift
//  Tp_fruits_RayaneMENKAR
//
//  Created by COURS1 on 20/02/2026.
//

import SwiftUI

// MARK: - Fruit Model
/// Modèle représentant un fruit avec toutes ses propriétés
struct Fruit: Identifiable, Codable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [String]
    var description: String
    var nutrition: [String]
    
    // CodingKeys pour exclure l'id de l'encodage/décodage
    enum CodingKeys: String, CodingKey {
        case title, headline, image, gradientColors, description, nutrition
    }
}
