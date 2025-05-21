//
//  HeaderView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//


import SwiftUI

struct HeaderView<Content: View>: View {
    let title: String
    var titleFont: Font = .title.bold()
    var titlePaddingTop: CGFloat? = nil
    @ViewBuilder let trailingContent: () -> Content

    init(
        title: String,
        titleFont: Font = .title.bold(),
        titlePaddingTop: CGFloat? = nil,
        @ViewBuilder trailingContent: @escaping () -> Content = { EmptyView() }
    ) {
        self.title = title
        self.titleFont = titleFont
        self.titlePaddingTop = titlePaddingTop
        self.trailingContent = trailingContent
    }

    var body: some View {
        HStack {
            Text(title)
                .font(titleFont)
                .padding(.top, titlePaddingTop ?? .zero)
            Spacer()
            trailingContent()

        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: Spacing.UltraLarge) {
        HeaderView(title: "PocketWords") {
            Button(action: {}) {
                Image(systemName: "plus")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color.blue))
            }
        }
        HeaderView(
            title: "Add New Word",
            titleFont: .system(size: FontSize.title, weight: .bold),
            titlePaddingTop: Padding.large
        ) {
            Button(action: {}) {
                Image(systemName: "xmark")
                    .font(.system(size: FontSize.header, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
        HeaderView(title: "No Button Example")
    }
}
