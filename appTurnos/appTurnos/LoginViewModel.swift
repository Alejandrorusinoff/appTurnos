//
//  LoginViewModel.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 01/03/2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var userToken: String = ""
    @Published var userId: String = ""
  
    func login() {
        Webservice().login(email: email, password: password)
    }
    
    func getUserToken() {
        Webservice().userToken
    }
}

