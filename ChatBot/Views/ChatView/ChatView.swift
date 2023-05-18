//
//  ChatView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject private var chatViewModel = ChatViewModel()
    let selectedPerson:SelectedPerson
    
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                ForEach(chatViewModel.messages,id:\.id) { message in
                    ChatCellView(message: message)
                }
            }
            VStack{
                Spacer()
                HStack{
                    TextField("Enter Your Text", text: $chatViewModel.userInput)
                    Button {
                        chatViewModel.sendMessage()
                    } label: {
                        HStack{
                            Text("Send")
                            Image(systemName: "paperplane.fill")
                        }

                        .foregroundColor(.blue)
                    }

                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20).stroke(.blue,lineWidth: 2)
                }
                

            }
        }
        .padding()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(selectedPerson: .einstein)
    }
}
