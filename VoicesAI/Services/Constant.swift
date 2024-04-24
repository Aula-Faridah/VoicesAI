//
//  Constant.swift
//  VoicesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation

struct Constant {
    static let baseURL = "https://api.elevenlabs.io/"
    static let appVersion = "v1"
    
    enum Endpoint: String {
        case textToSpeech = "text-to-speech"
        case speechToSpeech = "speech-to-speech"
    }
    
    enum VoiceID: String {
        case sallyFord = "IMaRqUzeNVCT6ks9SI4Y"
        case albertBanoy = "E01VVAfDdpbHObuCs5NH"
    }
    
    /// let urlString = Constant.fullURL(forVoice: .sallyFord)
    
    static func fullURL(forVoice voice: VoiceID) -> String {
        let result = baseURL + appVersion + "/" + Endpoint.textToSpeech.rawValue + "/" + voice.rawValue
        
        return result
    }
}


// Create Full URL endpoint ElevenLabs
