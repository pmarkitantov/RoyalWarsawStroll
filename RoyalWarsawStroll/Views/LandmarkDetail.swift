//
//  LandmarkDetail.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark

    var body: some View {
        VStack {
            if let imageName = landmark.images.first {
                Image(imageName)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .scaledToFit()
                    .padding()
            }

            Text(landmark.description)
                .font(.system(size: 18))
                .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    LandmarkDetail(landmark: MockData.landmarks[0])
}
