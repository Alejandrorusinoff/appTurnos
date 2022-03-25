//
//  appTurnosApp.swift
//  appTurnos WatchKit Extension
//
//  Created by Alejandro Rusinoff on 07/02/2022.
//

import SwiftUI

@main
struct appTurnosApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
