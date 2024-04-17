//
//  LandMark.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    var id: UUID
    var name: String
    var type: String
    var description: String
    var constructionDate: String?
    var keyFeatures: String?
    var isFavorite: Bool
    
    var additionalImages: [String]?
    
    private var imageName: String
    
    var mainImage: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    init(id: UUID = UUID(), name: String, type: String, description: String, constructionDate: String?, keyFeatures: String?, isFavorite: Bool, additionalImages: [String]?, imageName: String, coordinates: Coordinates) {
        self.id = id
        self.name = name
        self.type = type
        self.description = description
        self.constructionDate = constructionDate
        self.keyFeatures = keyFeatures
        self.isFavorite = isFavorite
        self.additionalImages = additionalImages
        self.imageName = imageName
        self.coordinates = coordinates
    }
}
