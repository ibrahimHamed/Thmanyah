//
//  AsyncImageView.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Kingfisher
import SwiftUI

struct AsyncImageView<Placeholder: View>: View {
    let url: URL?
    let size: CGSize
    let placeholder: Placeholder

    init(
        stringURL: String?,
        size: CGSize,
        @ViewBuilder placeholder: () -> Placeholder = { Color.gray }
    ) {
        self.url = URL(string: stringURL ?? "")
        self.size = size
        self.placeholder = placeholder()
    }

    var body: some View {
        KFImage(url)
            .placeholder {
                placeholder
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }
            .resizable()
            .scaledToFill()
            .frame(width: size.width, height: size.height)
            .clipped()
            .roundedCorner(.small)
    }
}
