//
//  SwiftDataManager.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/19/25.
//

import Foundation
import SwiftData

class SwiftDataManager<T: PersistentModel>: DatabaseManager {
    typealias Item = T
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func insert(_ data: T) throws {
        context.insert(data)
        try context.save()
    }

    func fetchAll() throws -> [T] {
        let descriptor = FetchDescriptor<T>()
        return try context.fetch(descriptor)
    }
    
    func update(_ data: T) throws {
        try context.save()
    }
    
    func delete(_ data: T) throws {
        context.delete(data)
        try context.save()
    }
}
