//
//  LoadingOverlay.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import SwiftUI

private struct LoadingOverlay: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)
            if isLoading {
                Color.black.opacity(0.55)
                    .ignoresSafeArea()
                    .overlay(
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(width: 80, height: 80)
                    )
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: isLoading)
    }
}

extension View {
    func loading(_ isLoading: Bool) -> some View {
        modifier(LoadingOverlay(isLoading: isLoading))
    }
}
