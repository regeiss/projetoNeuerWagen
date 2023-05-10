//
//  HomeScreen.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 07/05/23.
//

import SwiftUI

struct HomeScreen: View
{
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View
    {
        VStack
        {
            Spacer()
            
            Text("Home.Title".localized)
                .font(.system(size: 24, weight: .bold, design: .default))
            
            Spacer()
            
            Button(
                action: viewModel.logout,
                label: {
                    Text("Home.LogoutButton.Title".localized)
                        .modifier(MainButton(color: Color.red))
                }
            )
        }
        .padding(30)
        .sheet(isPresented: $needsAppOnboarding)
        {
            OnBoardingScreen()
        }
    }
}
