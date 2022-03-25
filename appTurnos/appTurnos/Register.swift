//
//  Register.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 07/02/2022.
//

import SwiftUI

struct Register: View {
    @StateObject private var registerVM = RegisterViewModel()
    @State var name: String = ""
    @State var lastName: String = ""
    @State var province: String = ""
    @State var location: String = ""
    @State var direction: String = ""
    @State var dni: String = ""
    @State var DD: String = ""
    @State var MM: String = ""
    @State var YYYY: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var dateOfBirth: Date = Date()
       
    var body: some View {
        VStack(alignment: .center) {
//            Text("Register")
//                .font(.system(size: 20))
//                .fontWeight(.bold)
//                .foregroundColor(.blue)
//                .padding()
//            Image("img1")
//                .resizable()
//                .frame(width: 150, height: 150)
//                .clipShape(Circle())
//                .overlay{
//                    Circle().stroke(.white, lineWidth: 4)
//                }
            VStack(alignment: .center) {
                TextField("Name", text: $registerVM.name)
                    .keyboardType(.twitter)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
                TextField("Lastname", text: $registerVM.lastName)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
            }
            
            VStack(alignment: .center) {
                TextField("Province", text: $registerVM.province)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
                TextField("Location", text: $registerVM.location)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
                TextField("Direction", text: $registerVM.direction)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
            }
            
            VStack(alignment: .center) {
                TextField("DNI", text: $registerVM.dni)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
                
                Text("Date of birth")
                HStack{
                    TextField("DD", text: $registerVM.DD)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(8.0)
                        .font(.headline)
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                        .frame(maxWidth: .infinity)
                        .cornerRadius(6)
                    Text("/")
                    TextField("MM", text: $registerVM.MM)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(8.0)
                        .font(.headline)
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                        .frame(maxWidth: .infinity)
                        .cornerRadius(6)
                    Text("/")
                    TextField("YYYY", text: $registerVM.YYYY)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(8.0)
                        .font(.headline)
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                        .frame(maxWidth: .infinity)
                        .cornerRadius(6)
                }
                
                
//                DatePicker("Date of birth", selection: $dateOfBirth, displayedComponents: .date)
//                Text("Selected date:")
//                                        Text("\(dateOfBirth, formatter: dateFormatter)")
//                                            .multilineTextAlignment(.center)

            }
            VStack(alignment: .center) {
                TextField("E-mail", text: $registerVM.email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8.0)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)

                SecureField("Password", text: $registerVM.password)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(8)
                    .font(.headline)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
                    .frame(maxWidth: .infinity)
                    .cornerRadius(6)
    //                .onChange(of: registerVM.password, perform: { value in
    //                    print("Password value \(value)")
    //                })
    //            SecureField("Confirm Password", text: $password)
    //                .keyboardType(.emailAddress)
    //                .disableAutocorrection(true)
    //                .autocapitalization(.none)
    //                .padding(8)
    //                .font(.headline)
    //                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.934))
    //                .frame(maxWidth: .infinity)
    //                .cornerRadius(6)
    //                .onChange(of: password, perform: { value in
    //                    print("Password value \(value)")
    //                })
    //            Text("login")
    //                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            Button(action: {
                registerVM.register()
            }, label: {
                Text("Register")
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
        .padding(/*@START_MENU_TOKEN@*/.all, 15.0/*@END_MENU_TOKEN@*/)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
