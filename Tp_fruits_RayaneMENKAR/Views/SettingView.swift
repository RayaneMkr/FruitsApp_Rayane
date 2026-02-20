//
//  SettingView.swift
//  Tp_fruits_RayaneMENKAR
//
//  Created by COURS1 on 20/02/2026.
//

import SwiftUI

// MARK: - Setting View
/// Vue des paramètres de l'application
struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - Section FRUCTUS
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
                        Text("Developer")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Rayane MENKAR")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "apps.iphone")
                            .foregroundColor(.purple)
                        Text("Platform")
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
                
                // MARK: - Section CUSTOMIZATION
                Section(header: Text("CUSTOMIZATION")) {
                    Toggle(isOn: $isOnboarding) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.blue)
                            Text("Restart Application")
                                .fontWeight(.semibold)
                        }
                    }
                    .tint(.blue)
                }
                
                // MARK: - Section APPLICATION
                Section(header: Text("APPLICATION")) {
                    HStack {
                        Image(systemName: "doc.text")
                            .foregroundColor(.gray)
                        Text("Terms & Conditions")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    HStack {
                        Image(systemName: "hand.raised")
                            .foregroundColor(.gray)
                        Text("Privacy Policy")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    HStack {
                        Image(systemName: "flame")
                            .foregroundColor(.red)
                        Text("Website")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("fructus.app")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "link")
                            .foregroundColor(.blue)
                        Text("SwiftUI Course")
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Settings")
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
