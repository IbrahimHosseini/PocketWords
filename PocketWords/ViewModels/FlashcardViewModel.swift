//
//  FlashcardViewModel.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//

import Foundation
import SwiftData

@Observable
class FlashcardViewModel {
    var error: String? = nil
    
    private let database: SwiftDataManager<WordCard>
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
        self.database = SwiftDataManager<WordCard>(context: context)
    }
    
    func checkAnswer(userAnswer: String, card: WordCard) -> Bool {
        let trimmedUserAnswer = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        let correctMeaning = card.meaning.lowercased()
        let isCorrect = trimmedUserAnswer == correctMeaning

        update(card, isCorrect)

        return isCorrect
    }

    fileprivate func update(_ card: WordCard, _ isCorrect: Bool) {
        card.mastered = isCorrect
        do {
            try context.save()
        } catch {
            self.error = error.localizedDescription
        }
    }
}
