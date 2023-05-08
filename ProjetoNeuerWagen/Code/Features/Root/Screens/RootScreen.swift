//
//  RootScreen.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 07/05/23.
//

import SwiftUI

struct RootScreen: View
{
    @EnvironmentObject var auth: Auth
    
    var body: some View
    {
        if auth.loggedIn
        {
            HomeScreen()
        }
        else
        {
            LoginScreen()
        }
    }
}
