//
//  PlayButton.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//

import SwiftUI

struct PlayButton: View {
    var duration: String

    var body: some View {
        HStack(spacing: 10) {
            playIcon
            durationText
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(background)
        .clipShape(Capsule())
    }

    private var playIcon: some View {
        Image(systemName: "play.fill")
            .resizable()
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.primary)
            .frame(width: 10, height: 10)
    }

    private var durationText: some View {
        Text(duration)
            .font(.caption2)
            .truncationMode(.middle)
            .foregroundColor(.primary)
            .fixedSize(horizontal: true, vertical: false)
    }

    private var background: some ShapeStyle {
        Color(.tertiarySystemFill)
    }
}
