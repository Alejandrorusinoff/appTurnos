//
//  CalendarView.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 07/02/2022.
//

import SwiftUI

struct CalendarView: View {
    @State var currentDate: Date = Date()
    var body: some View {
        DatePicker("Select Date", selection: $currentDate)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
