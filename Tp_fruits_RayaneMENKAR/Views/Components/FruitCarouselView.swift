import SwiftUI

struct FruitCarouselView: View {
    let fruits: [Fruit]
    @Binding var currentIndex: Int
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<fruits.count, id: \.self) { index in
                FruitCardView(fruit: fruits[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct FruitCardView: View {
    let fruit: Fruit
    
    var body: some View {
        VStack(spacing: 20) {
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .frame(height: 240)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
            
            Text(fruit.title)
                .font(.system(size: 42, weight: .heavy))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
            
            Text(fruit.headline)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .lineLimit(2)
        }
        .padding(.vertical, 20)
    }
}
