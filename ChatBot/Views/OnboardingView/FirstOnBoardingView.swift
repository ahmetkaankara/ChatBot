//
//  FirstOnBoardingView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 20.05.2023.
//

import SwiftUI

struct FirstOnBoardingView: View {
    
    
    
    var body: some View {
        ZStack{
            Color.cyan
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Welcome To The ChatBot App")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Text("With this application, you can take the opportunity to talk to selected famous people. The answers you will receive will consist of the style of the person you want to talk to and his vocabulary")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                Spacer()
                
                
            }
            .multilineTextAlignment(.center)
        }
        
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct FirstOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        FirstOnBoardingView()
    }
}
