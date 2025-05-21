//
//  AnswerInputView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//
import SwiftUI

// MARK: - AnswerInputView
struct AnswerInputView: View {
    
    @Binding var userAnswer: String
    
    let placeholder: String
    let buttonTitle: String
    
    var onCheck: () -> Void

    var body: some View {
        HStack {
            TextField(placeholder, text: $userAnswer)
                .textFieldStyle(.plain)
            
            ActionButton(
                title: "Check",
                isSmallButton: true,
                isEnabled: !userAnswer.isEmpty,
                isLoading: false,
                action: onCheck
            )
        }
        .padding(.horizontal, Padding.small)
        .frame(height: Height.medium)
        .background(
            RoundedRectangle(cornerRadius: Radius.small)
                .stroke(Color.gray.opacity(Opacity.half), lineWidth: Width._1)
        )
    }
}
