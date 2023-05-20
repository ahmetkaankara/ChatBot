//
//  ChatCellView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import SwiftUI

struct ChatCellView: View {
    
    let message:Message
    let selectedPerson:SelectedPerson
    
    var personNameForImage:String {
        switch selectedPerson {
        case .einstein:
            return "einstein"
        case .edison:
            return "edison"
        case .elon:
            return "elon"
        case .tesla:
            return "nikola-tesla"
        }
    }
    

    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                if message.role == .user {
                    Spacer()
                }
                if message.role == .assistant{
                    
                    Image(personNameForImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                    
                }
                Text(message.content)
                if message.role == .user {
                    Image("user-profile-photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                }
                if message.role == .assistant{
                    Spacer()
                }
            }
            .padding(.vertical)
            Divider()
        }
        
        
    }
}

struct ChatCellView_Previews: PreviewProvider {
    static var previews: some View {
        ChatCellView(message: Message(id: UUID(), role: .assistant, content: "sa", createDate: Date()), selectedPerson: .einstein)
    }
}
