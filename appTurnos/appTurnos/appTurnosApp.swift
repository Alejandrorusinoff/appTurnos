//
//  appTurnosApp.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 07/02/2022.
//

import SwiftUI

@main
struct appTurnosApp: App {
    @StateObject private var loginVM = LoginViewModel()
    var body: some Scene {
        WindowGroup {
//            ContentView()
                AuthenticationView()
          
//            ContentView()
//            Login()
//            Register()
//            Dropdown()
//            HomeView()
        }
    }
}
