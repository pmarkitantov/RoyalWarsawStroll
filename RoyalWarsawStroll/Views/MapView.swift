//
//  MapView.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var vm: LandmarkViewModel
    
    var body: some View {
        ZStack {
            Map(position: .constant(.region($vm.mapRegion.wrappedValue)))

        }
    }
    
    
}


#Preview {
    MapView()
        .environmentObject(LandmarkViewModel())
}
