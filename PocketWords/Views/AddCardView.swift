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
    
    @State private var showErrorAlert = false
    @State private var viewModel: AddCardViewModel
        
    init(context: ModelContext) {
        _viewModel = State(wrappedValue: AddCardViewModel(context: context))
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
                text: $viewModel.word
            )
            
            // Meaning Field
            LabeledTextField(
                label: "Meaning",
                placeholder: "Enter word meaning",
                text: $viewModel.meaning
            )
            
            // Save Button
            ActionButton(
                title: "Save Card",
                isEnabled: !viewModel.word.isEmpty && !viewModel.meaning.isEmpty,
                isLoading: viewModel.isLoading,
                action: {
                    if viewModel.saveCard() {
                        dismiss()
                    } else {
                        showErrorAlert = true
                    }
                }
            )
            
            Spacer()
        }
        .padding(Padding.large)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: Radius.large, style: .continuous))
        )
        .alert("Error", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage ?? "An unknown error occurred.")
        }
        .onDisappear {
            viewModel.clearFields()
        }
    }
}
