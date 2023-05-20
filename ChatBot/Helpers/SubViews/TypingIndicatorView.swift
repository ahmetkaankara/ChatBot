//
//  TypingIndicatorView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 20.05.2023.
//

import SwiftUI

struct TypingIndicatorView: View {
    
    @State private var numberOfDots = 3
    let speed: Double = 0.3
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Typing")
            ForEach(0..<3) { i in
                Circle()
                    .opacity((self.numberOfDots == i) ? 1 : 0)
                    .foregroundColor(.black)
                    .frame(width:3,height: 3)
            }
            Spacer()
        }
        .animation(Animation.spring(response: 0.5,dampingFraction: 0.7,blendDuration: 0.1).speed(2), value: 2)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: self.speed, repeats: true) { _ in
                var randomNumb: Int
                repeat {
                    randomNumb = Int.random(in: 0...2)
                } while randomNumb == self.numberOfDots
                self.numberOfDots = randomNumb
            }
        }
    }
    
}

struct TypingIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        TypingIndicatorView()
    }
}
