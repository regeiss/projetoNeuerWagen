//
//  LoginAction.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 07/05/23.
//

import Foundation

struct LoginAction
{
    let path = "/login"
    let method: HTTPMethod = .post
    var parameters: LoginRequest
    
    func call(completion: @escaping (LoginResponse) -> Void)
    {
        APIRequest<LoginRequest, LoginResponse>.call(
            path: path,
            method: .post,
            parameters: parameters
        ) { data in
            if let response = try? JSONDecoder().decode(
                LoginResponse.self,
                from: data
            ) {
                completion(response)
            }
            else
            {
                print("Unable to decode response JSON")
            }
        }
    }
}
