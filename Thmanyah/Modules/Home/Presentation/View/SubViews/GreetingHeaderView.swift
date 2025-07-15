//
//  GreetingHeaderView.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct GreetingHeaderView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundStyle(.goldenYellow)
                .frame(width: 28, height: 28)
                .clipShape(Circle())
            
            Text("Ibrahim".greeting())
                .font(.callout)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Image(systemName: "crown.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .symbolEffect(.bounce.down.byLayer, options: .repeat(.continuous))
                .foregroundStyle(.goldenYellow)
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
