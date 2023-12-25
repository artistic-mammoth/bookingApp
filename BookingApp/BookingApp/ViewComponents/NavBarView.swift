//
//  NavBarView.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import SwiftUI

struct NavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var title: String
    
    var showBackButton: Bool = false
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            TextComponents.navigationTitle(title)
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding(16)
        .background(Color.white.ignoresSafeArea(edges: .top))
    }
}

private extension NavBarView {
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.black)
        })
    }
}

#Preview {
    NavBarView(title: "Отель")
}
