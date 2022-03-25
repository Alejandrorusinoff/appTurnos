//
//  SummaryView.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 09/02/2022.
//

import SwiftUI

struct SummaryView: View {
    @State var date: Date = Date()
    @State var value = "Cardiología"

    var body: some View {
        VStack(alignment: .center){
            Text("Turn")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            Text("Date: \(date) ")
                .font(.title3)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.722, opacity: 0.254))
                .foregroundColor(Color(hue: 1.0, saturation: 0.094, brightness: 0.291))
                .cornerRadius(6)

            
            Text("Specialist type: \(value)")
                .font(.title3)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.722, opacity: 0.254))
                .foregroundColor(Color(hue: 1.0, saturation: 0.094, brightness: 0.291))
                .cornerRadius(6)
   
            Text("Additional Information: Lorem ipsum dolor, sit amet consectetur adipisicing elit. Officia id error ex iure! Facere minima dicta voluptates architecto corporis odio deleniti, velit et labore officia animi porro accusantium, ipsa amet?")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all)
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.722, opacity: 0.254))
                .cornerRadius(6)
                .foregroundColor(Color(hue: 1.0, saturation: 0.094, brightness: 0.291))
            Spacer()
            
//            Button(action: {}) {
//                NavigationLink(destination: HomeView(navigateToHomeView: <#Binding<Bool>#>)) {
//                    Text("Confirm")
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.center)
//                        .padding(.vertical, 10.0)
//                        .frame(width: 250)
//                        .background(Color.blue)
//                        .cornerRadius(40)
//                        .shadow(radius: 0)
//                        .padding()
//                }
//            }
        }
        .padding()
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
