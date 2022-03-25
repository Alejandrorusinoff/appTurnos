//
//  ContentView.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginVM = LoginViewModel()
    @StateObject var webservice = Webservice()
    @State var email: String = ""
    @State var password: String = ""
    @State var navigateToSecond = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome \(loginVM.userToken)")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Image("img1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text("The ideal app to take shifts")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Spacer()
                TextField("Email", text: $loginVM.email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
                    .onChange(of: loginVM.email, perform: { value in
                        print("Username value \(value)")
                    })
                SecureField("Password", text: $loginVM.password)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
                    .onChange(of: loginVM.password, perform: { value in
                        print("Password value \(value)")
                    })
                Text("did you forget the password?")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                Button(action: {})
//                {
//                    NavigationLink(destination: Login())
//                    {
//                        Text("Login")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(width: 250.0)
//                            .background(Color.blue)
//                            .cornerRadius(40)
//                            .shadow(radius: 10)
//                    }
//                }
                
                Button(action: {
                    loginVM.login()
                    print("probando ----> \(loginVM.getUserToken()) <----")
                }, label: {
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250.0)
                        .background(Color.blue)
                        .cornerRadius(40)
                        .shadow(radius: 10)
                })
                

                Button(action: {}) {
                    NavigationLink(destination: Register()) {
                        Text("Register")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding()
                            .frame(width: 250.0)
                            .background(Color.white)
                            .cornerRadius(40)
                            .shadow(radius: 10)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
