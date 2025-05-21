//
//  DatabaseManager.swift
//  PocketWords
//
//  Created by Ibrahim  on 5/19/25.
//


import Foundation

protocol DatabaseManager {
    associatedtype Item
    
    func insert(_ data: Item) throws
    func fetchAll() throws -> [Item]
    func update(_ data: Item) throws
    func delete(_ data: Item) throws
}
