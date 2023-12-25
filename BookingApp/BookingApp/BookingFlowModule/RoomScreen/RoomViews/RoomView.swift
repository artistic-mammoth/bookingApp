//
//  RoomView.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import SwiftUI

struct RoomView: View {
    // MARK: - Public properties
    @ObservedObject var viewModel: RoomViewModel
    
    // MARK: - View body
    var body: some View {
        VStack {
            NavBarView(title: viewModel.hotelTitle, showBackButton: true)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.roomsData, id: \.self) { room in
                        RoomCellView(roomData: room)
                            .padding(.vertical, 4)
                    }
                }
                .padding(.vertical, 8)
            }
            .scrollIndicators(.hidden)
            .background(.mainBackground)
            Spacer()
        }
        .onAppear {
            viewModel.getRoomsData()
        }
    }
}

#Preview {
    RoomView(viewModel: RoomViewModel(networkClient: NetworkClientImpl()))
}
