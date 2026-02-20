//
//  FruitListView.swift
//  Tp_fruits_RayaneMENKAR
//
//  Created by COURS1 on 20/02/2026.
//

import SwiftUI

// MARK: - Fruit List View
/// Vue de la liste de tous les fruits
struct FruitListView: View {
    @EnvironmentObject var viewModel: FruitViewModel
    @State private var isShowingSettings = false
    
    var body: some View {
        List {
            ForEach(viewModel.fruits) { fruit in
                NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                    FruitRowView(fruit: fruit)
                }
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Fruits")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingSettings = true
                }) {
                    Image(systemName: "gear")
                        .font(.title3)
                        .foregroundColor(.primary)
                }
            }
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingView()
        }
    }
}

// MARK: - Fruit Row View
/// Vue d'une ligne de fruit dans la liste
struct FruitRowView: View {
    let fruit: Fruit
    
    var body: some View {
        HStack(spacing: 15) {
            // Fruit Image
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: getGradientColors(),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .padding(-8)
                )
                .padding(8)
            
            // Fruit Info
            VStack(alignment: .leading, spacing: 5) {
                Text(fruit.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(fruit.headline)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 5)
    }
    
    /// Récupère les couleurs de gradient depuis les noms de couleurs
    private func getGradientColors() -> [Color] {
        return fruit.gradientColors.map { Color($0) }
    }
}
