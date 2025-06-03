//
//  AddCardViewModel.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/19/25.
//

import Foundation
import SwiftData

@Observable
class AddCardViewModel {
    var word: String = ""
    var meaning: String = ""
    var isLoading: Bool = false
    var error: Error? = nil
    var errorMessage: String? = nil
    
    private let database: SwiftDataManager<WordCard>
    
    init(context: ModelContext) {
        self.database = SwiftDataManager(context: context)
    }
    
    func saveCard() -> Bool {
        // Clear previous errors
        error = nil
        errorMessage = nil
        
        // Validate input
        guard validateInput() else {
            return false
        }
        
        // Create and save card
        let trimmedWord = word.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedMeaning = meaning.trimmingCharacters(in: .whitespacesAndNewlines)
        let card = WordCard(word: trimmedWord, meaning: trimmedMeaning)
        
        return addCard(card)
    }
    
    private func validateInput() -> Bool {
        let trimmedWord = word.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedMeaning = meaning.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if word is empty
        guard !trimmedWord.isEmpty else {
            setError("Word cannot be empty or contain only spaces.")
            return false
        }
        
        // Check if meaning is empty
        guard !trimmedMeaning.isEmpty else {
            setError("Meaning cannot be empty or contain only spaces.")
            return false
        }
        
        // Check minimum length
        guard trimmedWord.count >= 2 else {
            setError("Word must be at least 2 characters long.")
            return false
        }
        
        guard trimmedMeaning.count >= 2 else {
            setError("Meaning must be at least 2 characters long.")
            return false
        }
        
        // Check maximum length
        guard trimmedWord.count <= 50 else {
            setError("Word must be 50 characters or less.")
            return false
        }
        
        guard trimmedMeaning.count <= 200 else {
            setError("Meaning must be 200 characters or less.")
            return false
        }
        
        // Check if word contains only valid characters
        guard isValidWord(trimmedWord) else {
            setError("Word can only contain letters, spaces, hyphens, and apostrophes.")
            return false
        }
        
        return true
    }
    
    private func isValidWord(_ word: String) -> Bool {
        let validWordPattern = "^[a-zA-Z\\s\\-']+$"
        let wordPredicate = NSPredicate(format: "SELF MATCHES %@", validWordPattern)
        return wordPredicate.evaluate(with: word)
    }
    
    private func addCard(_ card: WordCard) -> Bool {
        isLoading = true
        
        do {
            try database.insert(card)
            isLoading = false
            return true
        } catch {
            self.error = error
            self.errorMessage = "Failed to save card: \(error.localizedDescription)"
            isLoading = false
            return false
        }
    }
    
    private func setError(_ message: String) {
        errorMessage = message
        error = ValidationError.invalidInput(message)
    }
    
    func clearFields() {
        word = ""
        meaning = ""
        error = nil
        errorMessage = nil
    }
}

// MARK: - Custom Errors
enum ValidationError: LocalizedError {
    case invalidInput(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidInput(let message):
            return message
        }
    }
}
