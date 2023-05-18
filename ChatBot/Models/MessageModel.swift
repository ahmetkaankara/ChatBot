//
//  MessageModel.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import Foundation

struct Message:Encodable,Decodable {
    
    let id: UUID
    let role:Role
    let content: String
    let createDate: Date
    
}
