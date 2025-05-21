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
    
    private let database: SwiftDataManager<WordCard>
    
    init(context: ModelContext) {
        self.database = SwiftDataManager(context: context)
    }
    
    func addCard(_ card: WordCard) {
        isLoading = true
        do {
            try database.insert(card)
            self.isLoading = false
            
        } catch {
            self.error = error
        }
    }
}
