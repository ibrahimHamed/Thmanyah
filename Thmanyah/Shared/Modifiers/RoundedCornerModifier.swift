//
//  RoundedCornerModifier.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

enum CornerRadiusSize {
    case small
    case medium
    case large

    var value: CGFloat {
        switch self {
        case .small: return 8
        case .medium: return 16
        case .large: return 24
        }
    }
}

struct RoundedCornerModifier: ViewModifier {
    let size: CornerRadiusSize

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: size.value, style: .continuous))
    }
}

extension View {
    func roundedCorner(_ size: CornerRadiusSize) -> some View {
        self.modifier(RoundedCornerModifier(size: size))
    }
}
