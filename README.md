# PocketWords

**PocketWords** is a simple, single-screen iPhone app designed for vocabulary learning. It allows users to add vocabulary cards, flip through them, type answers, get instant feedback, and track their learning progress. All data is stored locally using Apple’s SwiftData.

---

## Features

### 📝 Add Cards
- Open a modal sheet to add new vocabulary.
- Enter the “Word” and “Meaning” in two TextFields.
- Save adds a `WordCard` entity to SwiftData storage.

### 🎴 Flashcard Viewer
- Browse cards in a stack.
- Tap any card to flip between the word (front) and the meaning (back).

### ⌨️ Answer Input & Instant Feedback
- Type your answer in the TextField below the card.
- On Return, your input is trimmed and lowercased and checked against the correct meaning.

### ⭐ XP & Progress
- +10 XP for every correct answer.
- ProgressView shows XP and mastery.

### 💾 Persistence
- All cards and XP are stored locally using SwiftData.

---
## Technical Details

- **Architecture:** MVVM (Model-View-ViewModel) for separating UI and business logic.
- **Persistence:** SwiftData for all data storage.
- **Testing:** Unit tests provided.
- **Requirements:**  
  - Xcode 16  
  - iOS 18  
  - No external dependencies

---

## How to Use

1. **Add a Card:**  
   Tap the "+" button, fill in the "Word" and "Meaning," then tap "Save."
2. **Flip a Card:**  
   Tap any card to view its meaning or word side.
3. **Check an Answer:**  
   Type the meaning and press Return or tap “Check” to get instant feedback.
4. **Earn XP:**  
   Correct answers award 10 XP and increase your progress bar.

---

## Development

- Follows MVVM best practices for code structure.
- Uses SwiftData exclusively for local persistence.
- Includes unit tests for critical business logic.
- Easily extensible for accessibility.

## Getting Started

1. Clone the repo:
   ```sh
   git clone https://github.com/IbrahimHosseini/PocketWords.git


