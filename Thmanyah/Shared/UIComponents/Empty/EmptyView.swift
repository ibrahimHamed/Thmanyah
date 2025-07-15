//
//  EmptyView.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import SwiftUI

struct EmptyView: View {
    let type: EmptyStateType

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: type.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.gray)

            Text(type.title)
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    VStack {
        EmptyView(type: .noContent)
        EmptyView(type: .noResults)
        EmptyView(type: .search)
    }
    
}
