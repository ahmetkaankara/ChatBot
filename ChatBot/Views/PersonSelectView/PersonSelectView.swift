//
//  PersonSelectView.swift
//  ChatBot
//
//  Created by Ahmet Kaan Kara on 18.05.2023.
//

import SwiftUI

//Selected Person Enum
enum SelectedPerson {
    case einstein
    case edison
    case elon
    case tesla
}

struct PersonSelectView: View {
    
    private var defaults = UserDefaults.standard

    @State var selectedPerson:SelectedPerson = .einstein
    @State var navigateToChatView = false
    @State var shouldShowOnBoarding:Bool = false
    var body: some View {
        
        
        NavigationView {
            VStack{
                Text("Welcome To ChatBot App")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Text("Please select your person and start chat")
                
                VStack{
                    HStack{
                        Image("einstein")
                            .resizable()
                            .scaledToFit()
                            .frame(width:100,height: 100)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(selectedPerson == .einstein ? .green : .black,lineWidth: 3)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.black))
                            }
                            .onTapGesture {
                                selectedPerson = .einstein
                            }
                        
                        Image("edison")
                            .resizable()
                            .scaledToFit()
                            .frame(width:100,height: 100)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(selectedPerson == .edison ? .green : .black,lineWidth: 3)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.black))
                            }
                            .onTapGesture {
                                selectedPerson = .edison
                            }
                    }
                    HStack{
                        Image("elon")
                            .resizable()
                            .scaledToFit()
                            .frame(width:100,height: 100)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(selectedPerson == .elon ? .green : .black,lineWidth: 3)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.black))
                            }
                            .onTapGesture {
                                selectedPerson = .elon
                            }
                        Image("nikola-tesla")
                            .resizable()
                            .scaledToFit()
                            .frame(width:100,height: 100)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(selectedPerson == .tesla ? .green : .black,lineWidth: 3)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.black))
                            }
                            .onTapGesture {
                                selectedPerson = .tesla
                            }
                    }
                }
                
                Spacer()
                Spacer()
                Button {
                    navigateToChatView.toggle()
                } label: {
                    Text("Start Chat")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blue)
                        }
                }
                NavigationLink(destination: ChatView(selectedPerson: selectedPerson),isActive: self.$navigateToChatView) {
                    Text("")
                }
            }
            .padding()

        }
        .onAppear{
            if defaults.bool(forKey: "isFirstTimeLaunch"){
                defaults.set(false, forKey: "isFirstTimeLaunch")
                shouldShowOnBoarding = true
            }
        }
        .fullScreenCover(isPresented: $shouldShowOnBoarding, content: {
            OnBoardingView(shouldShowOnboarding: $shouldShowOnBoarding)
        })

    }
}

struct PersonSelectView_Previews: PreviewProvider {
    static var previews: some View {
        PersonSelectView()
    }
}
