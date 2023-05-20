//
//  SecondOnBoardingView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 20.05.2023.
//

import SwiftUI

struct SecondOnBoardingView: View {
    var body: some View {
        ZStack{
            Color.indigo
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("All you have to do is choose the person you want to talk to and start chatting!")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .bold()
                Spacer()
                Text("The persons you can select for the chat:")
                    .font(.title3)
                    .bold()
                
                PersonPromotionView(personName: "Albert Einstein", personImageName: "einstein")
                PersonPromotionView(personName: "Thomas Edison", personImageName: "edison")
                PersonPromotionView(personName: "Elon Musk", personImageName: "elon")
                PersonPromotionView(personName: "Nikola Tesla", personImageName: "nikola-tesla")

                Spacer()
                Spacer()
                
            }
            .foregroundColor(.white)
        }
        
    }
}

struct SecondOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        SecondOnBoardingView()
    }
}

struct PersonPromotionView: View{
    
    let personName:String
    let personImageName:String
    
    var body: some View{
        HStack{
            Image(personImageName)
                .resizable()
                .scaledToFit()
                .frame(width:100,height: 100)
                .padding()
            Text(personName)
                .font(.headline)
                .bold()

        }
    }
    
}
