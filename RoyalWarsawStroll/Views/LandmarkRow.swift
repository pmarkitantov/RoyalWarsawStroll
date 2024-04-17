//
//  LandmarkRow.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.mainImage
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    LandmarkRow(landmark: MockData.landmarks[0])
}
