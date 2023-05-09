//
//  APIError.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 07/05/23.
//

import Foundation

enum APIError: String, Error
{
    case jsonDecoding
    case response
    case noInternet
}
