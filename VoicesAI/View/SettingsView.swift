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
                    TextField("ElevenLabs Key", text: $elevenLabsKey)
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
                Button(action: {
                    
                }, label: {
                    Text("Save")
                        .padding(.trailing, 8)
                        .foregroundStyle(.blue)
                })
            }
        }
    }
}

#Preview {
    SettingsView()
}
