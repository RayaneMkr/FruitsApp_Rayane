//
//  ContentView.swift
//  Tp_fruits_RayaneMENKAR
//
//  Created by COURS1 on 20/02/2026.
//

import SwiftUI

// MARK: - Content View (Écran principal)
/// Écran d'accueil avec carousel de fruits et bouton Start
struct ContentView: View {
    @StateObject private var viewModel = FruitViewModel()
    @State private var isShowingFruitList = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    // App Title
                    Text("Fructus")
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    
                    Text("Learn about fruits")
                        .font(.title2)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    // Fruit Carousel
                    if !viewModel.fruits.isEmpty {
                        FruitCarouselView(fruits: viewModel.fruits)
                            .frame(maxHeight: 400)
                    }
                    
                    Spacer()
                    
                    // Start Button
                    Button(action: {
                        isShowingFruitList = true
                    }) {
                        Text("Start")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(
                                LinearGradient(
                                    colors: [Color.pink, Color.purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                }
            }
            .navigationDestination(isPresented: $isShowingFruitList) {
                FruitListView()
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
