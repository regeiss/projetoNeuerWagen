//
//  HomeViewModel.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 07/05/23.
//

import Foundation

class HomeViewModel: ObservableObject
{
    func logout()
    {
        Auth.shared.logout()
    }
}
