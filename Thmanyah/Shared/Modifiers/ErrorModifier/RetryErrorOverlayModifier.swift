//
//  RetryErrorOverlayModifier.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import SwiftUI

struct RetryErrorOverlayModifier: ViewModifier {
    @Binding var message: String?
    let retry: () -> Void
    
    func body(content: Content) -> some View {
        ZStack {
            content.disabled(message != nil)
            
            if let msg = message {
                RetryErrorOverlayView(message: msg, retry: retry, dismiss: { message = nil })
                    .ignoresSafeArea(.all)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: message)
    }
}

extension View {
    func retryErrorOverlay(message: Binding<String?>, retry: @escaping () -> Void) -> some View {
        modifier(RetryErrorOverlayModifier(message: message, retry: retry))
    }
}
