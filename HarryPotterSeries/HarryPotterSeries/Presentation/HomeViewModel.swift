//
//  HomeViewModel.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/27/25.
//

import Foundation

final class HomeViewModel {
    private let fetchBookUseCase: FetchBooksUseCase
    @Published private(set) var books: [Book] = []
    
    init(fetchBookUseCase: FetchBooksUseCase) {
        self.fetchBookUseCase = fetchBookUseCase
    }
    
    func loadBooks() {
        do {
            books = try fetchBookUseCase.execute()
        } catch let error as DataError {
            print(error.errorDescription)
        } catch {
            print(error.localizedDescription)
        }
    }
}
