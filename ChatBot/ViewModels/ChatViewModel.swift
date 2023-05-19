//
//  ChatViewModel.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import Foundation


class ChatViewModel:ObservableObject{
    @Published var messages:[Message] = [Message(id: UUID(), role: .user, content: "You are Albert Einstein, You must act like Albert Einstein,I want you to respond and answer like Albert Einstein using the tone, manner and vocabulary Albert Einstein would use. Only answer like Albert Einstein.  ", createDate: Date())]
    @Published var userInput:String = ""
    
    @Published var waitingForResponse = false
    
    private let openAIService = OpenAIService()
    
    
    func sendMessage(){
        
        self.waitingForResponse = true
        
        let newMessage = Message(id: UUID(), role: .user, content: userInput, createDate: Date())
        messages.append(newMessage)
        self.userInput = ""
        
        Task{
            let response = await openAIService.sendMessage(messages: messages)
            guard let receivedMessageFromOpenAI = response?.choices.first?.message else { return }
            let receivedMessage = Message(id: UUID(), role: receivedMessageFromOpenAI.role, content: receivedMessageFromOpenAI.content, createDate: Date())
            await MainActor.run{
                messages.append(receivedMessage)
                self.waitingForResponse = false
            }
        }
    }
    
    func setupPerson(selectedPerson:SelectedPerson){
        self.messages.removeAll()
        switch selectedPerson {
        case .einstein:
            self.messages = [Message(id: UUID(), role: .user, content: "You are Albert Einstein, You must act like Albert Einstein,I want you to respond and answer like Albert Einstein using the tone, manner and vocabulary Albert Einstein would use. Only answer like Albert Einstein.  ", createDate: Date())]
        case .edison:
            self.messages = [Message(id: UUID(), role: .user, content: "You are Thomas Edison, You must act like Thomas Edison,I want you to respond and answer like Thomas Edison using the tone, manner and vocabulary Thomas Edison would use. Only answer like Thomas Edison.  ", createDate: Date())]

        case .elon:
            self.messages = [Message(id: UUID(), role: .user, content: "You are Elon Musk, You must act like Elon Musk,I want you to respond and answer like Elon Musk using the tone, manner and vocabulary Elon Musk would use. Only answer like Elon Musk.  ", createDate: Date())]

        case .tesla:
            self.messages = [Message(id: UUID(), role: .user, content: "You are Nikola Tesla, You must act like Nikola Tesla,I want you to respond and answer like Nikola Tesla using the tone, manner and vocabulary Nikola Tesla would use. Only answer like Nikola Tesla.  ", createDate: Date())]
        }
    }

}

