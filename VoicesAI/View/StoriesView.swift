//
//  StoriesView.swift
//  VoicesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import SwiftUI

struct StoriesView: View {
    @State private var selectedTopic: Topics = .persahabatan
    @State private var selectedMood: Mood = .bahagia
    
    @State private var todayStory: String = ""
    
    
    var body: some View {
        NavigationStack{
            Form {
                // MARK: -PICKER VIEW
                Section {
                    Picker(selection: $selectedTopic) {
                        ForEach(Topics.allCases, id: \.self) { topic in
                            Text(topic.rawValue.capitalized)
                                .font(.subheadline)
                                .tag(topic)
                        }
                    } label: {
                        Text("Choose topics")
                            .foregroundStyle(.gray)
                    }
                    
                    Picker("Choose mood", selection: $selectedMood) {
                        ForEach(Mood.allCases, id: \.self) { mood in
                            Text(mood.rawValue.capitalized)
                                .font(.subheadline)
                                .tag(mood)
                        }
                    }
                    .foregroundStyle(.gray)
                } header: {
                    Text("Topics")
                } footer: {
                    Text("Choose any topics and mood that you want to listen.")
                }
                
                // MARK: -TEXT EDITOR
                Section {
                    TextEditor(text: $todayStory)
                        .frame(height: 200)
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                } header: {
                    Text("Today's story")
                } footer: {
                    Text("The stories are generated by Gemini AI.")
                }
                
                // MARK: -BUTTON GENERATE
                Button(action: {
                    
                }, label: {
                    Text("Generate".uppercased())
                        .font(.system(.callout, design: .rounded))
                        .fontWeight(.bold)
                })
                .buttonStyle(PlainButtonStyle())
                .frame(minWidth: 0, maxWidth: .infinity)


            }
            .navigationTitle("Stories")
            .tint(.primary)
        }
    }
}

#Preview {
    StoriesView()
}