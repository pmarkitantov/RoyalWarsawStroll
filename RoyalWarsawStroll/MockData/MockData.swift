//
//  MockData.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import Foundation

enum MockData {
    static let landmarks: [Landmark] = [
        Landmark(
            id: UUID(),
            name: "Royal Castle",
            type: "Castle",
            description: "The Royal Castle in Warsaw is a royal residence that formerly served throughout the centuries as the official residence of the Polish monarchs. It is located in the Castle Square, at the entrance to the Warsaw Old Town.",
            constructionDate: "1596",
            keyFeatures: "Baroque architecture, Sigismund's Column",
            isFavorite: false,
            additionalImages: ["image2", "image3"],
            imageName: "mockImage",
            coordinates: Landmark.Coordinates(latitude: 52.2476, longitude: 21.0143)
        ),
        Landmark(
            id: UUID(),
            name: "Old Town Market Place",
            type: "Square",
            description: "The Old Town Market Place is the center and oldest part of the Old Town of Warsaw, capital of Poland. It is one of Warsaw's most prominent tourist attractions and a UNESCO World Heritage Site.",
            constructionDate: "13th century",
            keyFeatures: "Mermaid of Warsaw statue, colorful buildings",
            isFavorite: true,
            additionalImages: ["image4", "image5"],
            imageName: "mockImage",
            coordinates: Landmark.Coordinates(latitude: 52.2497, longitude: 21.0120)
        ),
    ]
}
