//
//  HomeView.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 07/02/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var createTurnsVM = HomeViewModel()
    @StateObject private var loginVM = LoginViewModel()
//    var navigateToHomeView: Binding<Bool>
    @State var isNetworkOn: Bool = true
    @State var color: Color = .blue
    @State private var isScrollExpanded = false
    var specialties = ["Cardiología", "Estomatología", "Gastroenterología", "Neurología", "Pediatría", "Psiquiatría", "Dermatología", "Traumatología", "Radiología"]
    var body: some View {
        VStack (alignment: .center, spacing: 15) {
            DatePicker("Select a date", selection: $createTurnsVM.turnDateandTime, in: Date()...)
            Text("Specialist type \(createTurnsVM.specialist)")
                .font(.title3)
            DisclosureGroup("\(createTurnsVM.specialist)", isExpanded: $isScrollExpanded) {
                ScrollView{
                    VStack{
                        ForEach(specialties, id: \.self) {specialtie in
                            Text("\(specialtie)")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity)
                            .font(.body)
                            .onTapGesture {
                                createTurnsVM.specialist = specialtie
                                withAnimation{
                                    self.isScrollExpanded.toggle()
                                }
                            }
                        }
                    }
                }.frame(height: 170)
            }
                .accentColor(.white)
                .font(.title2)
                .foregroundColor(.black)
                .padding(5)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.722, opacity: 0.254))
                .cornerRadius(8)
//            TextField("E-mail", text: $registerVM.email)
            TextEditor(text: $createTurnsVM.additionalInformation)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.722, opacity: 0.254))
                .frame(width: .infinity, height: 300)
                .font(.body)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .foregroundColor(.black)
                .cornerRadius(6)
            Spacer()
            
            Button(action: {
                createTurnsVM.createTurns()
//                print("userID ---> \(loginVM.getUserToken())")
            }, label: {
                Text("Confirm turn")
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
                }
            )
//            Spacer()
        }.padding(.all)
    }
    
}


