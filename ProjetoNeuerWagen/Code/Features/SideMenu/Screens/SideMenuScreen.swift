//
//  SideMenuScreen.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 09/05/23.
//

import SwiftUI

struct SideMenuView: View
{
    @Binding var showMenu: Bool
    let router = MyRouter.shared
    let appBuild = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    //Text("Versão \(Bundle.versionBuild)").bold().font(.title).foregroundColor(.secondary)

    var body: some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Login")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            .onTapGesture
            {
                showMenu = false
                router.toLogin()
            }
            HStack
            {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Perfil")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            .onTapGesture
            {
                showMenu = false
                router.toListaPerfil()
            }
            HStack
            {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Mensagens")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            .onTapGesture
            {
                showMenu = false
                router.toMenu()
            }
            HStack
            {
                Image(systemName: "gearshape")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Configurações")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            .onTapGesture
            {
                showMenu = false
                router.toConfig()
            }
            Spacer()
            HStack
            {
                Text("WerkstadtG v.")
                Text(appBuild)
                    .foregroundColor(.gray)
            }.padding([.leading, .bottom])
        }.padding()
         .frame(maxWidth: .infinity, alignment: .leading)
         .background(Color(red: 32/255, green: 32/255, blue: 32/255))
         .edgesIgnoringSafeArea(.all)
    }
}
