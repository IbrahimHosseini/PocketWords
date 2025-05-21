//
//  CardNavigationView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//


import SwiftUI

struct CardNavigationView: View {
    let currentIndex: Int
    let totalCount: Int
    let onPrevious: () -> Void
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: Spacing.small) {
            // Navigation Row
            HStack {
                Button(action: onPrevious) {
                    Image(systemName: "chevron.left")
                        .padding()
                        .background(Circle().fill(Color.gray.opacity(Opacity.quarter)))
                }
                .disabled(currentIndex == 1)

                Spacer()

                Text("\(currentIndex) of \(totalCount)")
                    .font(.headline)

                Spacer()

                Button(action: onNext) {
                    Image(systemName: "chevron.right")
                        .padding()
                        .background(Circle().fill(Color.gray.opacity(Opacity.quarter)))
                }
                .disabled(currentIndex == totalCount)
            }

            // Selection Lines/Dots
            HStack(spacing: Spacing.small) {
                ForEach(1...totalCount, id: \.self) { i in
                    Capsule()
                        .fill(i == currentIndex ? Color.blue : Color.gray.opacity(Opacity.quarter))
                        .frame(width: i == currentIndex ? Width._20 : Width._10, height: Spacing.small)
                        .animation(.easeInOut(duration: Duration.fast), value: currentIndex)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, Padding.normal)
    }
}

#Preview {
    CardNavigationView(currentIndex: 1, totalCount: 10, onPrevious: {}, onNext: {})
}
