//
//  ContentView.swift
//  projetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 06/05/23.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        RootScreen()
            .environmentObject(Auth.shared)
    }
}
