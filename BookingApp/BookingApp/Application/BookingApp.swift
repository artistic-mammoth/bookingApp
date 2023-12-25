//
//  BookingApp.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import SwiftUI

@main
struct BookingApp: App {
    
    var networkClient: NetworkClient = NetworkClientImpl()
    
    var body: some Scene {
        WindowGroup {
            HotelView(viewModel: HotelViewModel(networkClient: networkClient))
        }
    }
}
