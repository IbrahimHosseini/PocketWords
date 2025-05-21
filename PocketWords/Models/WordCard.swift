//
//  WordCard.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/17/25.
//

import Foundation
import SwiftData

@Model
final class WordCard: Identifiable {
    @Attribute(.unique) var id: String
    var word: String
    var meaning: String
    var mastered: Bool
    
    init(word: String, meaning: String, mastered: Bool = false) {
        self.id = UUID().uuidString
        self.word = word
        self.meaning = meaning
        self.mastered = mastered
    }
}
