//
//  ChatCellView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import SwiftUI

struct ChatCellView: View {
    
    let message:Message
    
    var body: some View {
        VStack{
            HStack{
                if message.role == .user {
                    Spacer()
                }
                if message.role == .assistant{
                    Image("einstein")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                        
                }
                Text(message.content)
                if message.role == .user {
                    Image(systemName: "person")
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
        ChatCellView(message: Message(id: UUID(), role: .assistant, content: "sa", createDate: Date()))
    }
}
