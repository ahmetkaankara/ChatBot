//
//  LastOnBoardingView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 20.05.2023.
//

import SwiftUI

struct LastOnBoardingView: View {
    @Binding var shouldShowOnboarding:Bool
    var body: some View {
        ZStack{
            Color.teal
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Almost Done !")
                    .font(.largeTitle)
                Spacer()
                Text("After selecting the person you want to chat with, all you have to do is press the 'Start Chat' button at the bottom. After that, you can ask that person any question you want.")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .padding(.bottom)
                Spacer()
                Button {
                    shouldShowOnboarding.toggle()
                } label: {
                    Text("Get Started")
                        .frame(width: 200,height: 50)

                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.green)
                        }
                }
                
                Spacer()
                Spacer()

            }
            .foregroundColor(.white)
            .bold()


        }
        
    }
}

struct LastOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        LastOnBoardingView(shouldShowOnboarding: .constant(true))
    }
}
