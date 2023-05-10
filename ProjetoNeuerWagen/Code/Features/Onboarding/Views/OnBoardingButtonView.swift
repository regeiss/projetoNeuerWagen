//
//  OnBoardingButtonView.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 09/05/23.
//

import SwiftUI

struct OnBoardingButtonView: View
{
    @AppStorage("needsAppOnboarding") var needsAppOnboarding: Bool = true
    
    var body: some View
    {
        GeometryReader { proxy in
            LazyHStack
            {
                Button(action: {
                    needsAppOnboarding = false},
                    label:
                        { Text("Finish Setup")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .font(Font.title2.bold().lowercaseSmallCaps())
                })
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(40)
                .frame(minWidth: 0, maxWidth: proxy.size.width - 40)
            }
            .frame(width: proxy.size.width, height: proxy.size.height/1.5)
        }
    }
}
