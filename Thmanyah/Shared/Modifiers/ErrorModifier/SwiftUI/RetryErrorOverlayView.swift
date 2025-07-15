//
//  RetryErrorOverlayView.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 15/07/2025.
//
import SwiftUI

struct RetryErrorOverlayView: UIViewRepresentable {
    let message: String
    let retry: () -> Void
    let dismiss: () -> Void
    
    func makeUIView(context: Context) -> RetryErrorOverlay {
        let overlay = RetryErrorOverlay()
        return overlay
    }
    
    func updateUIView(_ uiView: RetryErrorOverlay, context: Context) {
        uiView.configure(message: message, retry: retry, dismiss: dismiss)
    }
}
