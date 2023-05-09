//
//  projetoNeuerWagenApp.swift
//  projetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 06/05/23.
//

import SwiftUI

@main
struct ProjetoNeuerWagenApp: App
{
    init()
    {
        NetworkMonitor.shared.startMonitoring() // Added this
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
        }
    }
}
