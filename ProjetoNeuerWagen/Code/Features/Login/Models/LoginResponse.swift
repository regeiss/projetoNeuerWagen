//
//  LoginResponse.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 07/05/23.
//

import Foundation

struct LoginResponse: Decodable
{
    let data: LoginResponseData
}

struct LoginResponseData: Decodable
{
    let accessToken: String
    let refreshToken: String
}
