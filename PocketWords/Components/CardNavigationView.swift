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
    let onNavigate: (Int) -> Void

    var body: some View {
        VStack(spacing: Spacing.small) {
            // Navigation Row
            HStack {
                Button(action: { onNavigate(currentIndex - 1) }) {
                    Image(systemName: "chevron.left")
                        .padding()
                        .background(Circle().fill(Color.gray.opacity(Opacity.quarter)))
                }
                .disabled(currentIndex == 1)

                Spacer()

                Text("\(currentIndex) of \(totalCount)")
                    .font(.headline)

                Spacer()

                Button(action: { onNavigate(currentIndex + 1) }) {
                    Image(systemName: "chevron.right")
                        .padding()
                        .background(Circle().fill(Color.gray.opacity(Opacity.quarter)))
                }
                .disabled(currentIndex == totalCount)
            }

            // Selection Lines/Dots (now tappable)
            HStack(spacing: Spacing.small) {
                ForEach(1...totalCount, id: \.self) { index in
                    Capsule()
                        .fill(index == currentIndex ? Color.blue : Color.gray.opacity(Opacity.quarter))
                        .frame(width: index == currentIndex ? Width._20 : Width._10, height: Spacing.small)
                        .animation(.easeInOut(duration: Duration.fast), value: currentIndex)
                        .onTapGesture {
                            onNavigate(index)
                        }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, Padding.normal)
    }
}

#Preview {
    CardNavigationView(currentIndex: 1, totalCount: 10, onNavigate: { _ in })
}