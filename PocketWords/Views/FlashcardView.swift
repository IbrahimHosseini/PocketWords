//
//  FlashcardView.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//

import SwiftUI
import SwiftData

struct FlashcardView: View {
    @State private var isFlipped = false
    @State private var userAnswer = ""
    @State private var result: Bool? = nil
    @State private var cardIndex = 1
    @State private var showAddCard = false
    @State private var viewModel: FlashcardViewModel
    
    @Environment(\.modelContext) private var context
    
    @Query var cards: [WordCard]
    
    init(context: ModelContext) {
        self._viewModel = State(initialValue: FlashcardViewModel(context: context))
    }
    
    var body: some View {
        
        VStack(spacing: Spacing.medium) {
            
            // Header
            HeaderView(title: "PocketWords") {
                Button(action: {
                    showAddCard.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.blue))
                }
            }
            .padding(.top, Padding.medium)
            
            if cards.isEmpty {
                EmptyListView(
                    title: "No cards yet.",
                    desc: "Tap the + button above to add your first card."
                )
                .onTapGesture {
                    showAddCard.toggle()
                }
            } else {
                
                // Progress
                ProgressStatusView(
                    totalCorrect: cards.filter { $0.mastered == true }.count,
                    totalCards: cards.count
                )
                
                // Flashcard
                FlashcardFlipView(
                    isFlipped: isFlipped,
                    word: cards[cardIndex - 1].word,
                    meaning: cards[cardIndex - 1].meaning,
                    cardIndex: cardIndex,
                    totalCards: cards.count,
                    onTap: {
                        isFlipped.toggle()
                    }
                )
                .frame(height: Height._200)
                
                // Answer Input + Feedback
                VStack(alignment: .leading, spacing: Spacing.small) {
                    
                    AnswerInputView(
                        userAnswer: $userAnswer,
                        placeholder: "Enter your answer...",
                        buttonTitle: "Check") {
                            
                            result = viewModel.checkAnswer(
                                userAnswer: userAnswer,
                                card: cards[cardIndex - 1]
                            )
                            
                        }
                    
                    if let result {
                        FeedbackAlertView(
                            result: result,
                            correctText: "Correct! +10 XP",
                            incorrectText: "Incorrect. Try again."
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.top, Padding.medium)
                
                Spacer()
                
                // Navigation
                CardNavigationView(
                    currentIndex: cardIndex,
                    totalCount: cards.count) {
                        if cardIndex > 1 {
                            withAnimation {
                                cardIndex -= 1
                            }
                            resetValues()
                        }
                    } onNext: {
                        if cardIndex < cards.count {
                            withAnimation {
                                cardIndex += 1
                            }
                            resetValues()
                        }
                    }
            }
        }
        .sheet(isPresented: $showAddCard) {
            AddCardView(context: context)
                .presentationDetents([.height(Height._420)])
                .presentationCornerRadius(Radius.large)
        }
    }
    
    fileprivate func resetValues() {
        isFlipped = false
        result = nil
        userAnswer = ""
        showAddCard = false
    }
}
