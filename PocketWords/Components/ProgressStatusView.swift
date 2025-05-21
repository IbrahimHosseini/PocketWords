//
//  ProgressStatusView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//
import SwiftUI

// MARK: - ProgressStatusView
struct ProgressStatusView: View {
    let totalCorrect: Int
    let totalCards: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.mini) {
            HStack {
                Text("\(totalCorrect * Constant.xp) XP")
                Spacer()
                Text("\(totalCards * Constant.xp) XP").bold()
            }
            
            ProgressView(value: Double(totalCorrect), total: Double(totalCards))
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
        }
        .font(.caption)
        .padding(.horizontal)
        .padding(.top, Padding.normal)
        .padding(.bottom, Padding.large)
    }
}
