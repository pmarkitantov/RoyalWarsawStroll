//
//  LandMark.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Identifiable, Equatable {
    static func == (lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.name == rhs.name
    }
    

    var name: String
    var type: String
    var description: String
    var constructionDate: String?
    var keyFeatures: String?
    var isFavorite: Bool
    let coordinates: CLLocationCoordinate2D
    let images: [String]
    
    var id: String {
        name
    }
    
   
}
