//
//  WhatsNewScreen.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 10/05/23.
//

import SwiftUI

struct WhatsNewScreen: View   
{
    @State var showNew: Bool = true
    @State var align: HorizontalAlignment = .center
    @State var color: Color = .accentColor
    @State var size: String = "mini"
    @State var label: String = "Mostrar notas release"
    @State var labelImage: String = "arrow.up.circle"
    @State var labelColor: Color = Color(UIColor.systemBackground)
    @State var history: Bool = true
    @State var data: String = "data"
    @State var showDrop: Bool = false 
    
    var body: some View
    {
        SwiftNEW(show: $showNew, align: $align, color: $color, size: $size, labelColor: $labelColor, label: $label, labelImage: $labelImage, history: $history, data: .constant("data"), showDrop: $showDrop)
    }
}
