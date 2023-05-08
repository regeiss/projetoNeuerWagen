//
//  MainButton.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 07/05/23.
//

import SwiftUI

struct MainButton: ViewModifier
{
    var color: Color = Color.blue
    
    func body(content: Content) -> some View
    {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .frame(maxWidth: .infinity, maxHeight: 60)
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(10)
    }
}
