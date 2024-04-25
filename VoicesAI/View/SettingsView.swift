//
//  SettingsView.swift
//  VoicesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var geminiAIKey = ""
    @State private var elevenLabsKey = ""
    
    let signUpGemini = "https://ai.google.dev"
    let signUpElevenlabs = "https://elevenlabs.io/app/sign-up"
    
    
    var body: some View {
        NavigationStack{
            Form{
                // MARK: -API KEY
                Section {
                    TextField("Gemini AI Key", text: $geminiAIKey)
                        .onAppear{
                            geminiAIKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
                        }
                    TextField("ElevenLabs Key", text: $elevenLabsKey)
                        .onAppear{
                            elevenLabsKey = UserDefaults.standard.string(forKey: "ElevenLabsKey") ?? ""
                        }
                } header: {
                    Text("API_KEYS")
                } footer: {
                    Text("Please input your API KEY above.")
                }
                
                // MARK: -LINK
                Section {
                    Link("GET API KEY GEMINI AI", destination: URL(string: signUpGemini)!)
                        .foregroundStyle(.link)
                    
                    Link("GET API KEY ELEVEN LABS", destination: URL(string: signUpElevenlabs)!)
                        .foregroundStyle(.link)
                    
                } header: {
                    Text("Don't have API KEY")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }
                
                
            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                // MARK: -SAVE KEY
                Button(action: {
                    saveKey()
                }, label: {
                    Text("Save")
                        .padding(.trailing, 8)
                        .foregroundStyle(.blue)
                })
                .disabled(geminiAIKey.isEmpty || elevenLabsKey.isEmpty)
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView{
    func saveKey() {
        UserDefaults.standard.set(geminiAIKey, forKey: "GeminiAIKey")
        UserDefaults.standard.set(elevenLabsKey, forKey: "ElevenLabsKey")
    }
}
