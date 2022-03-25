//
//  HomeViewModel.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 07/03/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var specialist: String = "Cardiología"
    @Published var turnDateandTime: Date = Date()
    @Published var additionalInformation: String = ""
    @Published var location: String = "Buenos aires"
    @Published var direction: String = "Los polvorines"
  
    func createTurns() {
        Webservice().createTurns(
            specialist: specialist,
            turnDateandTime: turnDateandTime,
            additionalInformation: additionalInformation,
            location:location,
            direction: direction
        )
    }
}
