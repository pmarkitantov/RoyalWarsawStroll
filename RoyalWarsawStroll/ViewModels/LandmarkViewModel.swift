//
//  LocationViewModel.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 18/04/2024.
//

import Foundation
import MapKit
import SwiftUI

class LandmarkViewModel: ObservableObject {
    
    @Published var landmarks: [Landmark]
    
    @Published var mapLocation: Landmark {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    @Published var showLocationList: Bool = false

    init() {
        let landmarks = MockData.landmarks
        self.landmarks = landmarks
        self.mapLocation = landmarks.first!
        
//        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Landmark) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
}

