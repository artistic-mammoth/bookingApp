//
//  RoomViewModel.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import Foundation
import Combine

class RoomViewModel: ObservableObject {
    // MARK: - Public properties
    var networkClient: NetworkClient
    var cancelable: Set<AnyCancellable> = []
    
    @Published var roomsData: [RoomData] = []
    @Published var hotelTitle: String = ""
    
    // MARK: - Init
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: - Public methods
    func getRoomsData() {
        networkClient.sendRequest(RoomRequest())
            .sink { _ in }
            receiveValue: { [weak self] data in
                guard let self = self else { return }
                for room in data.rooms {
                    self.roomsData.append(RoomData(
                        name: room.name,
                        price: "\(room.price.withThousandsSeparator()) ₽",
                        pricePer: room.pricePer.lowercased(),
                        peculiarities: room.peculiarities,
                        imageUrls: room.imageUrls))
                }
            }.store(in: &cancelable)
    }
}
