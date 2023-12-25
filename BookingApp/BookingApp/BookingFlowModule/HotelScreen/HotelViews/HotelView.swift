//
//  HotelView.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import SwiftUI

struct HotelView: View {
    //MARK: - Public properties
    @ObservedObject var viewModel: HotelViewModel
    
    // MARK: - View body
    var body: some View {
        VStack {
            NavBarView(title: "Отель")
            ScrollView {
                VStack(alignment: .leading) {
                    HotelInfoCard(imageURLs: viewModel.imageURLs,
                                  raitingText: viewModel.raitingText,
                                  hotelName: viewModel.hotelName,
                                  hotelAdress: viewModel.hotelAdress,
                                  minimalPrice: viewModel.minimalPrice,
                                  priceForItText: viewModel.priceForIt)
                    
                    HotelDescriptionCard(peculiarities: viewModel.peculiarities,
                                         description: viewModel.description,
                                         additionalButtonsData: viewModel.additionalData)
                }
                .padding(.bottom, 12)
            }
            .scrollIndicators(.hidden)
            .background(.mainBackground)
            
            ActiveButton(action: {}, label: "К выбору номера")
                .padding(.top, 12)
                .padding(.horizontal, 16)
        }
        .onAppear {
            viewModel.getHotelData()
        }
    }
}

#Preview {
    HotelView(viewModel: HotelViewModel(networkClient: NetworkClientImpl()))
}
