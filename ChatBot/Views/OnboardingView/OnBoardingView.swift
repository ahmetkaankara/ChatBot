//
//  OnBoardingView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 20.05.2023.
//

import SwiftUI

struct OnBoardingView: View {
    
    @Binding var shouldShowOnboarding:Bool
    
    var body: some View {
        TabView{
            FirstOnBoardingView()
            
            SecondOnBoardingView()
            
            LastOnBoardingView(shouldShowOnboarding: $shouldShowOnboarding)
        }
        .edgesIgnoringSafeArea(.all)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(shouldShowOnboarding: .constant(true))
    }
}
