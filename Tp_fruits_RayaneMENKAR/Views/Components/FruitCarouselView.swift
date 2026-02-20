//
//  FruitCarouselView.swift
//  Tp_fruits_RayaneMENKAR
//
//  Created by COURS1 on 20/02/2026.
//

import SwiftUI

// MARK: - Fruit Carousel View
/// Vue du carousel de fruits avec TabView et slider
struct FruitCarouselView: View {
    let fruits: [Fruit]
    @State private var currentPage = 0
    
    var body: some View {
        VStack(spacing: 20) {
            // TabView Carousel
            TabView(selection: $currentPage) {
                ForEach(0..<fruits.count, id: \.self) { index in
                    FruitCardView(fruit: fruits[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 350)
            
            // Page Indicator (custom slider)
            HStack(spacing: 8) {
                ForEach(0..<fruits.count, id: \.self) { index in
                    Circle()
                        .fill(currentPage == index ? Color.white : Color.white.opacity(0.5))
                        .frame(width: 8, height: 8)
                        .scaleEffect(currentPage == index ? 1.2 : 1.0)
                        .animation(.spring(), value: currentPage)
                }
            }
        }
    }
}

// MARK: - Fruit Card View
/// Carte individuelle pour chaque fruit dans le carousel
struct FruitCardView: View {
    let fruit: Fruit
    
    var body: some View {
        VStack(spacing: 20) {
            // Fruit Image
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
            
            // Fruit Name
            Text(fruit.title)
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
            
            // Fruit Headline
            Text(fruit.headline)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .frame(maxWidth: 400)
        }
        .padding(20)
    }
}
