//
//  MockData.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import Foundation
import MapKit

enum MockData {
    static let landmarks: [Landmark] = [
        Landmark(
            name: "Royal Castle",
            type: "Castle",
            description: "The Royal Castle in Warsaw is a royal residence that formerly served throughout the centuries as the official residence of the Polish monarchs. It is located in the Castle Square, at the entrance to the Warsaw Old Town.",
            constructionDate: "1596",
            keyFeatures: "Baroque architecture, Sigismund's Column",
            isFavorite: false,
            coordinates: Coordinate(latitude: 52.2476, longitude: 21.0143),
            images: ["mockImage"]
        ),
        Landmark(
            name: "Old Town Market Place",
            type: "Square",
            description: "The Old Town Market Place is the center and oldest part of the Old Town of Warsaw, capital of Poland. It is one of Warsaw's most prominent tourist attractions and a UNESCO World Heritage Site.",
            constructionDate: "13th century",
            keyFeatures: "Mermaid of Warsaw statue, colorful buildings",
            isFavorite: true,
            coordinates: Coordinate(latitude: 52.2497, longitude: 21.0120),
            images: ["mockImage"]
        )
    ]
}
