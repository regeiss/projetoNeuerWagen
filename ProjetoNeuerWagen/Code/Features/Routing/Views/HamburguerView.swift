//
//  HamburguerView.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 10/05/23.
//

import SwiftUI

struct HamburguerView: View
{
    @Binding var showMenu: Bool
    @State private var isShowingSheet = false
    
    var nomeView: String = ""
    var nomeMenu: String = "Menu inicial"
    
    func didDismiss()
    {
        // Handle the dismissing action.
    }
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Image(systemName: "line.horizontal.3").foregroundColor(.blue)
                    .imageScale(.large)
                    .padding([.leading])
                    .onTapGesture { withAnimation { self.showMenu.toggle()}}
                
                Text(nomeMenu).foregroundColor(.blue).font(.system(.title3, design: .rounded))
                Spacer()
                Image(systemName: "car.2").foregroundColor(.blue)
                    .imageScale(.large)
                    .padding([.trailing])
            }
        }
        
    }
}
