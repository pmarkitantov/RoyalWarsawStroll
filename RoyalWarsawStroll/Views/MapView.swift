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
                    .padding(.horizontal)

                Spacer()
                ZStack {
                    ForEach(vm.landmarks) { landmark in
                        if vm.mapLocation == landmark {
                            LandmarkPreviewView(landmark: landmark)
                                .shadow(radius: 20)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

extension MapView {
    private var header: some View {
        VStack {
            Button {
                vm.toggleLandmarkList()
            } label: {
                HStack(spacing: 0) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .padding()
                        .rotationEffect(.degrees(vm.showLandmarkList ? 180 : 0))
                        .frame(width: 15)
                        .padding(.horizontal)
                    Text(vm.mapLocation.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .animation(.none, value: vm.mapLocation)
                        .padding(.trailing)
                }
                .frame(height: 55)
            }
            .foregroundStyle(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 15))

            if vm.showLandmarkList {
                LandmarkList()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }

    private var descriptionPanel: some View {
        VStack {
                HStack {
                    Text(!vm.showLandmarkDescription ? "Показать описание" : "Cкрыть описание")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .padding()
                                .rotationEffect(.degrees(vm.showLandmarkDescription ? 0 : 180))
                        }
                }
            

            if vm.showLandmarkDescription {
                ScrollView {
                    LandmarkDetail(landmark: vm.mapLocation)
                }
                Spacer()
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
