//
//  EmptyListView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/19/25.
//

import SwiftUI

struct EmptyListView: View {
    let title: String
    let desc: String
    
    var body: some View {
        VStack(spacing: Spacing.medium) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Text(desc)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Padding.large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}
