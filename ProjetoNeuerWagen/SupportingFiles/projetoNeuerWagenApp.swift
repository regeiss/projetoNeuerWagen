//
//  projetoNeuerWagenApp.swift
//  projetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 06/05/23.
//

import SwiftUI
import UIPilot

@main
struct ProjetoNeuerWagenApp: App
{
    @StateObject var pilot = UIPilot(initial: AppRoute.root)
    
    init()
    {
        NetworkMonitor.shared.startMonitoring()
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            UIPilotHost(pilot) { route in
                switch route
                {
                case .root: RootScreen(showMenu: false)
                case .home: HomeScreen()
                case .login: LoginScreen()
                case .browser: EmptyView()
                }
            }
            
            // ContentView()
        }
    }
}
