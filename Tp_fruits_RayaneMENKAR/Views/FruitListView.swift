import SwiftUI

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

struct FruitRowView: View {
    let fruit: Fruit
    
    var body: some View {
        HStack(spacing: 15) {
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
    
    private func getGradientColors() -> [Color] {
        return fruit.gradientColors.map { Color($0) }
    }
}
