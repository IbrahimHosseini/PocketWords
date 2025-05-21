//
//  PocketWordsTests.swift
//  PocketWordsTests
//
//  Created by Ibrahim  on 5/17/25.
//

import XCTest
@testable import PocketWords
import SwiftData

final class PocketWordsTests: XCTestCase {
    
    var modelContainer: ModelContainer!
    var context: ModelContext!
    
    @MainActor
    override func setUp() {
        super.setUp()
        modelContainer = try! ModelContainer(
            for: WordCard.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        context = modelContainer.mainContext
    }
    
    @MainActor
    override func tearDown() {
        modelContainer = nil
        context = nil
        super.tearDown()
    }
    
    func makeTestCard(word: String = "Apple", meaning: String = "سیب", mastered: Bool = false) -> WordCard {
        let card = WordCard(word: word, meaning: meaning, mastered: mastered)
        context.insert(card)
        return card
    }
    
    @MainActor
    func testCheckAnswer_CorrectAnswer_MarksMastered() throws {
        let card = makeTestCard()
        let viewModel = FlashcardViewModel(context: context)
        
        let isCorrect = viewModel.checkAnswer(userAnswer: "  سیب ", card: card)
        
        XCTAssertTrue(isCorrect)
        XCTAssertTrue(card.mastered)
    }
    
    @MainActor
    func testCheckAnswer_IncorrectAnswer_DoesNotMarkMastered() throws {
        let card = makeTestCard()
        let viewModel = FlashcardViewModel(context: context)
        
        let isCorrect = viewModel.checkAnswer(userAnswer: "پرتقال", card: card)
        
        XCTAssertFalse(isCorrect)
        XCTAssertFalse(card.mastered)
    }
    
    @MainActor
    func testCheckAnswer_TrimAndCaseInsensitive() throws {
        let card = makeTestCard(meaning: "سیب")
        let viewModel = FlashcardViewModel(context: context)
        
        let isCorrect = viewModel.checkAnswer(userAnswer: "  سیب  ", card: card)
        XCTAssertTrue(isCorrect)
        
        let isCorrectCase = viewModel.checkAnswer(userAnswer: "سیب", card: card)
        XCTAssertTrue(isCorrectCase)
    }
    
}
