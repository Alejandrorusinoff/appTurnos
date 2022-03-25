//
//  AuthenticationView.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 23/03/2022.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var webservice = Webservice()
    
    var body: some View {
        if !webservice.userToken.isEmpty {
            HomeView()
        }
        else{
            ContentView()
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
