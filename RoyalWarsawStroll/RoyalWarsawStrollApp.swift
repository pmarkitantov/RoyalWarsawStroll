//
//  RoyalWarsawStrollApp.swift
//  RoyalWarsawStroll
//
//  Created by Pavel Markitantov on 17/04/2024.
//

import SwiftUI

@main
struct RoyalWarsawStrollApp: App {
    
    @StateObject private var vm = LandmarkViewModel()
    
    var body: some Scene {
        WindowGroup {
            MapView()
                .environmentObject(vm)
        }
    }
}
