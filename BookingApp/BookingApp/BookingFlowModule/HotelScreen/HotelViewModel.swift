//
//  HotelViewModel.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation
import Combine
import SwiftUI

class HotelViewModel: ObservableObject {
    // MARK: - Public properties
    private var networkClient: NetworkClient
    private var cancelable: Set<AnyCancellable> = []
    
    @Published var hotelName: String = ""
    @Published var hotelAdress: String = ""
    @Published var raitingText: String = ""
    @Published var minimalPrice: String = ""
    @Published var priceForIt: String = ""
    @Published var description: String = ""
    @Published var peculiarities: [String] = []
    @Published var imageURLs: [String] = []
    
    var additionalData: [AdditionalInfo] {
        [AdditionalInfo(header: "Удобства", secondaryText: "Самое необходимое", iconName: "emoji-happy"),
         AdditionalInfo(header: "Что включено", secondaryText: "Самое необходимое", iconName: "tick-square"),
         AdditionalInfo(header: "Что не включено", secondaryText: "Самое необходимое", iconName: "close-square")]
    }
    
    // MARK: - Init
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - Public methods
    func getHotelData() {
        networkClient.sendRequest(HotelRequest())
            .sink { _ in }
            receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.hotelName = data.name
                self.hotelAdress = data.adress
                self.raitingText = "\(data.rating) \(data.ratingName)"
                self.minimalPrice = "от \(data.minimalPrice.withThousandsSeparator()) ₽"
                self.priceForIt = data.priceForIt.lowercased()
                self.description = data.aboutTheHotel.description
                self.peculiarities = data.aboutTheHotel.peculiarities
                self.imageURLs = data.imageUrls
            }.store(in: &cancelable)
    }
}
