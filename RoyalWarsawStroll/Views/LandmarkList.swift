//
//  LansmarkListView.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject private var vm: LandmarkViewModel

    var filteredLandmarks: [Landmark] {
        MockData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        List {
            ForEach(vm.landmarks) { landmark in
                Button {
                    vm.showNextLocation(location: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    LandmarkList()
        .environmentObject(LandmarkViewModel())
}
