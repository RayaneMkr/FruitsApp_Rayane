import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FruitViewModel()
    @State private var isShowingFruitList = false
    @State private var currentFruitIndex = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    if !viewModel.fruits.isEmpty && currentFruitIndex < viewModel.fruits.count {
                        ZStack {
                            LinearGradient(
                                colors: viewModel.fruits[currentFruitIndex].gradientColors.map { Color($0) },
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .animation(.easeInOut(duration: 0.5), value: currentFruitIndex)
                            
                            VStack(spacing: 20) {
                                Spacer()
                                
                                Text("Fructus")
                                    .font(.system(size: 60, weight: .heavy))
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                                
                                Text("Découvrez les fruits")
                                    .font(.title2)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                
                                Spacer()
                                
                                FruitCarouselView(fruits: viewModel.fruits, currentIndex: $currentFruitIndex)
                                    .frame(maxHeight: 400)
                                
                                Spacer()
                                
                                Button(action: {
                                    isShowingFruitList = true
                                }) {
                                    Text("Commencer")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 55)
                                        .background(
                                            Capsule()
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                }
                                .padding(.horizontal, 50)
                                .padding(.bottom, 50)
                            }
                        }
                        .cornerRadius(40)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 15)
                    }
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
