//
//  ChatView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject private var chatViewModel = ChatViewModel()
    let selectedPerson:SelectedPerson
    
    var body: some View {
        VStack{
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack{
                        ForEach(chatViewModel.messages.dropFirst(),id:\.id) { message in
                            ChatCellView(message: message,selectedPerson: selectedPerson)
                        }
                        if chatViewModel.waitingForResponse {
                            TypingIndicatorView()
                        }
                        HStack{ Spacer() }.id("Empty")
                        
                    }
                    .onChange(of: chatViewModel.messages.count, perform: { newValue in
                        withAnimation(.easeOut(duration: 0.5)) {
                            proxy.scrollTo("Empty",anchor: .bottom)
                            
                        }
                        
                    })
                    
                }
                
                
            }
            Divider()
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
            
        }
        .onAppear{
            chatViewModel.setupPerson(selectedPerson: selectedPerson)
        }
        .padding()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(selectedPerson: .einstein)
    }
}
