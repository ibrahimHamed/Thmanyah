//
//  ThmanyahApp.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import SwiftUI

@main
struct ThmanyahApp: App {
    @StateObject private var diContainer = AppDIContainer()

    var body: some Scene {
        WindowGroup {
            diContainer.makeHomeView()
                .environmentObject(diContainer)
                .preferredColorScheme(.dark)
        }
    }
}
