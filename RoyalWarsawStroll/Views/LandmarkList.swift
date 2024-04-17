//
//  LansmarkListView.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        MockData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
//                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
