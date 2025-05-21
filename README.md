# PocketWords

PocketWords is a minimalist iPhone app for learning and mastering vocabulary using a flashcard system. Instantly check your answers, track your XP, and watch your progress grow — all data is securely saved locally using Apple’s SwiftData framework.

## Features

- **Add Cards:**  
  Add new vocabulary cards using a modal sheet with fields for “Word” and “Meaning.” Data is persisted locally with SwiftData.

- **Flashcard Viewer:**  
  Browse cards in a stack with 3D Y-axis flip animation. Front shows the word; back shows the meaning.

- **Answer Input & Feedback:**  
  Type the meaning below each card, hit Return, and receive instant feedback with a ✓ or ✗ and colored border.

- **XP & Progress:**  
  Earn +10 XP for each correct answer. Progress is displayed with a ProgressView, following Apple’s HIG.

- **Persistence:**  
  All vocabulary cards and XP are stored locally using SwiftData.

- **Accessibility (Optional):**  
  Prepared for VoiceOver accessibility (with accessibilityLabel and accessibilityHint).

## Technical Details

- **Architecture:** MVVM (Model-View-ViewModel) for separation of UI and business logic.
- **Persistence:** SwiftData for all data storage; no networking or AI calls.
- **Testing:** Unit tests provided for answer-checking logic. SwiftUI previews included.
- **Code Quality:** Written in Swift 5.9. No magic numbers—uses constants throughout.
- **Requirements:**  
  - Xcode 16  
  - iOS 18  
  - No external dependencies

## Usage

1. **Add Cards:**  
   Tap the "+" button, enter a new word and its meaning, and tap Save.

2. **Flip Cards:**  
   Tap any card to flip between the word and its meaning.

3. **Check Answers:**  
   Type your answer and tap “Check” to get instant feedback.

4. **Track Progress:**  
   Earn XP for correct answers. See your progress as a filled progress bar.

## Development

- Follows MVVM best practices for code structure.
- Uses SwiftData exclusively for local persistence.
- Includes unit tests for critical business logic.
- Easily extensible for accessibility.

## Getting Started

1. Clone the repo:
   ```sh
   git clone https://github.com/yourusername/pocketwords.git
