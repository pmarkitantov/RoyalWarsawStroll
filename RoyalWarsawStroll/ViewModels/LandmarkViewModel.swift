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
    @Published var landmarks: [Landmark] = []
    
    @Published var mapLocation: Landmark {
        didSet {
            self.updateMapRegion(location: self.mapLocation)
        }
    }
    
    let startLocation: Landmark = .init(name: "Нажмите чтобы выбрать дворец", type: "startScreen", description: "Tap the arrow at the top of the screen to open the list of landmarks.", isFavorite: false, coordinates: Coordinate(latitude: 52.2476, longitude: 21.0143), images: [])

    @Published var mapRegion: MKCoordinateRegion = .init()

    var mapSpan: MKCoordinateSpan {
        return MKCoordinateSpan(latitudeDelta: self.mapLocation.type == "startScreen" ? 0.01 : 0.005, longitudeDelta: self.mapLocation.type == "startScreen" ? 0.01 : 0.005)
    }
    
    @Published var showLandmarkList: Bool = false
    @Published var showLandmarkDescription: Bool = false
    @Published var sheetLandmark: Landmark? = nil

    init() {
        self.mapLocation = self.startLocation
        self.mapRegion.span = self.mapSpan
        let loadedLandmarks = self.loadLandmarksFromJSON(named: "data")
        self.landmarks = loadedLandmarks
        self.updateMapRegion(location: self.mapLocation)
    }
 
    private func loadLandmarksFromJSON(named fileName: String) -> [Landmark] {
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let loadedLandmarks = try decoder.decode([Landmark].self, from: data)
                return loadedLandmarks
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return [self.startLocation]
    }
    
    private func updateMapRegion(location: Landmark) {
        withAnimation(.easeInOut) {
            self.mapRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude),
                span: self.mapSpan
            )
        }
    }
    
    func toggleLandmarkList() {
        withAnimation(.easeInOut) {
            self.showLandmarkList = !self.showLandmarkList
        }
    }

    func toggleLandmarkDescription() {
        withAnimation(.easeInOut) {
            self.showLandmarkDescription = !self.showLandmarkDescription
        }
    }
    
    func showNextLocation(location: Landmark) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            self.showLandmarkList = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = landmarks.firstIndex(where: { $0 == mapLocation }) else {
            return
        }
        
        let nextIndex = currentIndex + 1
        guard self.landmarks.indices.contains(nextIndex) else {
            guard let firstLocation = landmarks.first else { return }
            self.showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = self.landmarks[nextIndex]
        self.showNextLocation(location: nextLocation)
    }
}
