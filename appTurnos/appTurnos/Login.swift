//
//  Login.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 07/02/2022.
//

import SwiftUI
import Combine

struct Login: View {
    @StateObject private var loginVM = LoginViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var navigateToHomeView = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                Text("Log in")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding()
                Spacer()
                Image("img1")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay{
                    }
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
                Spacer()
                Button(action: {
                    loginVM.login()
                }, label: {
                    Text("Login")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10.0)
                        .frame(width: 250)
                        .background(Color.blue)
                        .cornerRadius(40)
                        .shadow(radius: 0)
                        .padding()
                })
            }
//            .background(
//                Group {
//                    NavigationLink(
//                        destination: HomeView(navigateToHomeView: $navigateToHomeView),
//                        isActive: loginVM.userToken.isEmpty ? $navigateToHomeView: false,
//                        label: {
//                            EmptyView()
//                        })
//                }
//                .hidden()
//            )
            .padding(/*@START_MENU_TOKEN@*/.all, 15.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
