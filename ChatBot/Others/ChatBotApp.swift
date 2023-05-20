//
//  ChatBotApp.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import SwiftUI

@main
struct ChatBotApp: App {
    
    private var defaults = UserDefaults.standard
    
    var body: some Scene {
        WindowGroup {
            PersonSelectView()
        }
    }
    
    init(){
        if defaults.value(forKey: "isFirstTimeLaunch") == nil{
            defaults.set(true, forKey: "isFirstTimeLaunch")
        }
    }
}
