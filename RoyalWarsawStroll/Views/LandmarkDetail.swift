//
//  LandmarkDetail.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject private var vm: LandmarkViewModel
    var landmark: Landmark

    var body: some View {
        ScrollView {
            VStack {
                imageSection

                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

extension LandmarkDetail {
    private var imageSection: some View {
        TabView {
            ForEach(landmark.images, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 350)
        .tabViewStyle(PageTabViewStyle())
        .shadow(radius: 20, y: 10)
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(landmark.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let date = landmark.constructionDate {
                Text("Дата постройки: \(date)")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(landmark.description)
                .font(.subheadline)
        }
    }

    private var backButton: some View {
        Button {
            vm.sheetLandmark = nil
        }
            label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .padding(16)
                    .foregroundStyle(.primary)
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 4)
                    .padding()
            }
    }
}

#Preview {
    LandmarkDetail(landmark: MockData.landmarks[0])
}
