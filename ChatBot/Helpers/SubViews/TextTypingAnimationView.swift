//
//  TextTypingAnimationView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 20.05.2023.
//

import SwiftUI

struct TextTypingAnimationView: View {
    @State private var text = ""
    let fullText: String
    let typingInterval: Double

    init(text: String, typingInterval: Double = 0.1) {
        self.fullText = text
        self.typingInterval = typingInterval
    }

    var body: some View {
        Text(text)
            .onAppear {
                self.typeText()
            }
    }

    func typeText() {
        var currentIndex = text.endIndex
        Timer.scheduledTimer(withTimeInterval: typingInterval, repeats: true) { timer in
            if currentIndex < self.fullText.endIndex {
                currentIndex = self.fullText.index(after: currentIndex)
                self.text = String(self.fullText[..<currentIndex])
            } else {
                timer.invalidate()
            }
        }
    }
}

struct TypeWriterView: View {
    @State var text: String = ""
    @Binding var textCount:Int
    let finalText: String
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text(text)
                .onAppear{
                    typeWriter()
                }
                .onChange(of: text) { newValue in
                    textCount += 1
                }
        }
    }
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                text.append(finalText[position])
                typeWriter(at: position + 1)
            }
        }
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
