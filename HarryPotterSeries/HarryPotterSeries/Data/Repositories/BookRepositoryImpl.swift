//
//  BookRepository.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/27/25.
//

import Foundation

final class BookRepositoryImpl: BookRepository {
    private let dataService = DataService()
    
    func fetchBooks() throws -> [Book] {
        try dataService.fetchBooks()
    }
}
