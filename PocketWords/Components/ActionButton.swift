//
//  ActionButton.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//

import SwiftUI

// MARK: - ActionButton
struct ActionButton: View {
    let title: String
    var isSmallButton: Bool = false
    let isEnabled: Bool
    let isLoading: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            if isEnabled && !isLoading {
                action()
            }
        }) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                } else {
                    Text(title)
                        .font(.system(size: isSmallButton ? FontSize.caption : FontSize.header2, weight: isSmallButton ? .regular : .semibold))
                }
            }
            .padding(.vertical, isSmallButton ? Padding.small : Padding.normal)
            .padding(.horizontal, Padding.normal)
            .frame(maxWidth: isSmallButton ? Width.small : .infinity)
            .background(isEnabled && !isLoading ? Color.blue : Color.gray.opacity(Opacity.half))
            .foregroundColor(.white)
            .cornerRadius(isSmallButton ? Radius.small : Radius.medium)
            .opacity(isEnabled && !isLoading ? Opacity.full : Opacity.half)
        }
        .disabled(!isEnabled || isLoading)
    }
}

#Preview {
    VStack(spacing: Spacing.UltraLarge) {
        
        ActionButton(title: "OK", isSmallButton: false, isEnabled: true, isLoading: false) {}
            .padding(Spacing.UltraLarge)
        
        ActionButton(title: "check", isSmallButton: true, isEnabled: true, isLoading: false) {}
            .padding(Spacing.UltraLarge)
    }
}
