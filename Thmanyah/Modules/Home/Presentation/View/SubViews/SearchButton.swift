//
//  SearchButton.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import SwiftUI

struct SearchButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.goldenYellow)
                .accessibilityIdentifier("searchIcon")
        }
    }
}
