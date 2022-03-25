//
//  RegisterViewModel.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 04/03/2022.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var province: String = ""
    @Published var location: String = ""
    @Published var direction: String = ""
    @Published var dni: String = ""
    @Published var DD: String = ""
    @Published var MM: String = ""
    @Published var YYYY: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
  
    func register() {
        Webservice().register(
            name: name,
            lastName: lastName,
            province: province,
            location: location,
            direction: direction,
            dni: dni,
            DD: DD,
            MM: MM,
            YYYY: YYYY,
            email: email,
            password: password
        )
    }
}

