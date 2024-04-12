//
//  ChatResponse.swift
//  RecycleChat
//
//  Created by Mehran Sarwar on 4/11/24.
//

import Foundation

func getChatResponse(message: String)-> String {
    let chatMessage = message.lowercased()
    
    if chatMessage.contains("hi"){
        return "Hello there!"
    } else if chatMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if chatMessage.contains("how are you?"){
        return "I am fine, how about you?"
    } else {
        return "That is good to hear."
    }
    
}
