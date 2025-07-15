//
//  LoadingIndicator.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
                .scaleEffect(0.8)
            Spacer()
        }
        .listRowSeparator(.hidden)
        .padding(.vertical, 8)
    }
}
