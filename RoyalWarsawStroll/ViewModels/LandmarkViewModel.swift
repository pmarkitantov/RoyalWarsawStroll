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
    @Published var mapRegion: MKCoordinateRegion = .init()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    @Published var showLandmarkList: Bool = false

    init() {
        let landmarks = MockData.landmarks
        self.landmarks = landmarks
        self.mapLocation = landmarks.first!
    }
    
    private func updateMapRegion(location: Landmark) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude),
                span: mapSpan)
        }
    }
    
    func toggleLandmarkList() {
        withAnimation(.easeInOut) {
            showLandmarkList = !showLandmarkList
        }
    }
    
    func showNextLocation(location: Landmark) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLandmarkList = false
        }
    }
}
