//
//  ChatViewModel.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import Foundation


class ChatViewModel:ObservableObject{
    @Published var messages:[Message] = []
    @Published var userInput:String = ""
    
    private let openAIService = OpenAIService()
    
    func sendMessage(){
        
        let newMessage = Message(id: UUID(), role: .user, content: userInput, createDate: Date())
        messages.append(newMessage)
        self.userInput = ""
        
        Task{
            let response = await openAIService.sendMessage(messages: messages)
            guard let receivedMessageFromOpenAI = response?.choices.first?.message else { return }
            let receivedMessage = Message(id: UUID(), role: receivedMessageFromOpenAI.role, content: receivedMessageFromOpenAI.content, createDate: Date())
            await MainActor.run{
                messages.append(receivedMessage)
            }
        }
    }
}

