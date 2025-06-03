//
//  LabeledTextField.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//

import SwiftUI

struct LabeledTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.small) {
            Text(label)
                .font(.system(size: FontSize.header2, weight: .semibold))
            TextField(placeholder, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .stroke(Color.gray.opacity(Opacity.quarter), lineWidth: Width._1)
                )
                .font(.system(size: FontSize.header2))
        }
    }
}

#Preview {
    VStack(spacing: Spacing.large) {
        LabeledTextField(
            label: "Word",
            placeholder: "Enter new word",
            text: .constant("Example")
        )
        
        LabeledTextField(
            label: "Meaning",
            placeholder: "Enter word meaning",
            text: .constant("")
        )
        
        LabeledTextField(
            label: "Definition",
            placeholder: "Type here...",
            text: .constant("Sample text content")
        )
    }
    .padding(Spacing.large)
}