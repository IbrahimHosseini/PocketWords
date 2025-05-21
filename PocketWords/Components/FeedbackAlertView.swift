//
//  FeedbackAlertView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//


import SwiftUI

struct FeedbackAlertView: View {
    let result: Bool
    let correctText: String
    let incorrectText: String

    var body: some View {
        HStack {
            Image(systemName: result ? "checkmark.circle.fill" : "xmark.octagon.fill")
            Text(result ? correctText : incorrectText)

            Spacer()
        }
        .foregroundStyle(result ? Color.green : Color.red)
        .frame(maxWidth: .infinity, maxHeight: Width._25)
        .padding(.all, Padding.small)
        .background(result ? Color.green.opacity(Opacity.quarter) : Color.red.opacity(Opacity.quarter))
        .cornerRadius(Radius.small)
        .background(
            RoundedRectangle(cornerRadius: Radius.small)
                .stroke(result ? Color.green : Color.red, lineWidth: Width.half)
        )
    }
}
