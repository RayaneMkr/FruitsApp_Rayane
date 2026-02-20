//
//  FruitDetailView.swift
//  Tp_fruits_RayaneMENKAR
//
//  Created by COURS1 on 20/02/2026.
//

import SwiftUI

// MARK: - Fruit Detail View
/// Vue détaillée d'un fruit avec description complète et informations nutritionnelles
struct FruitDetailView: View {
    let fruit: Fruit
    @State private var isShowingNutrition = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header Image avec gradient
                ZStack {
                    LinearGradient(
                        colors: fruit.gradientColors.map { Color($0) },
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 400)
                    
                    Image(fruit.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .ignoresSafeArea(edges: .top)
                
                VStack(alignment: .leading, spacing: 20) {
                    // Fruit Title
                    Text(fruit.title)
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.primary)
                    
                    // Headline
                    Text(fruit.headline)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .lineSpacing(5)
                    
                    Divider()
                    
                    // Nutrition Section (déplacée ici, juste après le titre)
                    VStack(alignment: .leading, spacing: 10) {
                        Button(action: {
                            withAnimation {
                                isShowingNutrition.toggle()
                            }
                        }) {
                            HStack {
                                Text("Valeur nutritionnelle pour 100g")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Image(systemName: isShowingNutrition ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.primary)
                            }
                        }
                        
                        if isShowingNutrition {
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(Array(fruit.nutrition.enumerated()), id: \.offset) { index, value in
                                    HStack {
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 8, height: 8)
                                        
                                        Text(getNutritionLabel(for: index))
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        Spacer()
                                        
                                        Text(value)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.top, 5)
                            .transition(.opacity)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    Divider()
                    
                    // Description Title
                    Text("En savoir plus sur \(fruit.title)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    // Description Text
                    Text(fruit.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(8)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
    
    /// Retourne le label pour chaque valeur nutritionnelle
    private func getNutritionLabel(for index: Int) -> String {
        switch index {
        case 0: return "Énergie"
        case 1: return "Sucre"
        case 2: return "Graisse"
        case 3: return "Protéine"
        case 4: return "Vitamines"
        case 5: return "Minéraux"
        default: return "Autre"
        }
    }
}
