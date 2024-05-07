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
        Text(landmark.description)
            .font(.system(size: 18))
            .padding()
    }
}

#Preview {
    LandmarkDetail(landmark: MockData.landmarks[0])
}
