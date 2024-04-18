//
//  MapView.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject private var vm: LandmarkViewModel

    var body: some View {
        ZStack {
            Map(position: .constant(.region($vm.mapRegion.wrappedValue)))
            
            VStack(spacing: 0) {
                header
                    .padding()

                Spacer()
            }
        }
    }
}

extension MapView {
    private var header: some View {
        VStack {
            Text(vm.mapLocation.name)
                .font(.title2)
                .fontWeight(.bold)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .padding()
                        .rotationEffect(.degrees(vm.showLocationList ? 180 : 0))
                }

                .foregroundStyle(.primary)

            if vm.showLocationList {
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}

#Preview {
    MapView()
        .environmentObject(LandmarkViewModel())
}
