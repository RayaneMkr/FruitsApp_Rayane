import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("FRUCTUS")) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                        Text("Application")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Fructus")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "paintbrush")
                            .foregroundColor(.green)
                        Text("Design")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("SwiftUI")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.orange)
                        Text("Développeur")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Rayane MENKAR")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "apps.iphone")
                            .foregroundColor(.purple)
                        Text("Plateforme")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("iOS")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "number")
                            .foregroundColor(.red)
                        Text("Version")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section(header: Text("PERSONNALISATION")) {
                    Toggle(isOn: $isOnboarding) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.blue)
                            Text("Redémarrer l'application")
                                .fontWeight(.semibold)
                        }
                    }
                    .tint(.blue)
                }
                
                Section(header: Text("APPLICATION")) {
                    HStack {
                        Image(systemName: "doc.text")
                            .foregroundColor(.gray)
                        Text("Conditions d'utilisation")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    HStack {
                        Image(systemName: "hand.raised")
                            .foregroundColor(.gray)
                        Text("Politique de confidentialité")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    HStack {
                        Image(systemName: "flame")
                            .foregroundColor(.red)
                        Text("Site Web")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("fructus.app")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "link")
                            .foregroundColor(.blue)
                        Text("Cours SwiftUI")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Paramètres")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
