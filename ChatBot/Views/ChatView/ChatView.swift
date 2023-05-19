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
                            ChatCellView(message: message)
                        }
                        if chatViewModel.waitingForResponse {
                            ChatCellView(message: Message(id: UUID(), role: .assistant, content: "Typing...", createDate: Date()))
                            HStack{
                                Text("Typing")
                            }
                        }
                        HStack{ Spacer() }.id("Empty")

                    }
                    .onChange(of: chatViewModel.messages.count, perform: { newValue in
                        withAnimation(.easeOut(duration: 0.5)) {
                            proxy.scrollTo("Empty",anchor: .bottom)

                        }

                    })
//                    .onReceive($chatViewModel.messages.count) { _ in
//                        proxy.scrollTo("Empty",anchor: .bottom)
//                    }

                }


            }
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
