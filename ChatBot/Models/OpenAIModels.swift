//
//  OpenAIModels.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import Foundation


//For Encode
struct OpenAIChatBody:Encodable{
    let model:String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable{
    let role:Role
    let content:String
}

//enum for role

enum Role:String,Codable{
    case system
    case user
    case assistant
}

//For Response

struct OpenAIChatResponse:Decodable{
    let choices:[Choices]
}

struct Choices:Decodable{
    let message:OpenAIChatMessage
}

