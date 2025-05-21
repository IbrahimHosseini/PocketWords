//
//  AddCardView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//

import SwiftUI
import SwiftData

struct AddCardView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var word = ""
    @State private var meaning = ""
    
    @StateObject private var viewModel: AddCardViewModel
        
    init(context: ModelContext) {
        _viewModel = StateObject(wrappedValue: AddCardViewModel(context: context))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.large) {
            // Header
            HeaderView(
                title: "Add New Word",
                titleFont: .title.weight(.medium),
                titlePaddingTop: Padding.medium
            ) {
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark")
                        .font(.system(size: FontSize.header, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.top, Padding.medium)
                }
            }
            
            // Word Field
            LabeledTextField(
                label: "Word",
                placeholder: "Enter new word",
                text: $word
            )
            
            // Meaning Field
            LabeledTextField(
                label: "Meaning",
                placeholder: "Enter word meaning",
                text: $meaning
            )
            
            // Save Button
            ActionButton(
                title: "Save Card",
                isEnabled: !word.isEmpty && !meaning.isEmpty,
                isLoading: viewModel.isLoading,
                action: {
                    let card = WordCard(word: word, meaning: meaning)
                    viewModel.addCard(card)
                    dismiss()
                }
            )
            
            Spacer()
        }
        .padding(Padding.large)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: Radius.large, style: .continuous))
        )
    }
}
