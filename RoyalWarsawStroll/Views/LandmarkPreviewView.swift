//
//  LandmarkPreviewView.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 20/05/2024.
//

import SwiftUI

struct LandmarkPreviewView: View {
    @EnvironmentObject private var vm: LandmarkViewModel
    let landmark: Landmark

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            VStack(spacing: 8.0) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 50)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension LandmarkPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = landmark.images.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(landmark.name)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            if let date = landmark.constructionDate {
                Text(date)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var learnMoreButton: some View {
        Button {} label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }

    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LandmarkPreviewView(landmark: MockData.landmarks.first!)
    }
    .environmentObject(LandmarkViewModel())
}
