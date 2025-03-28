//
//  BookUseCase.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/27/25.
//

import Foundation

final class FetchBooksUseCase {
    private let repository: BookRepository
    
    init(repository: BookRepository = BookRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() throws -> [Book] {
        try repository.fetchBooks()
    }
}
