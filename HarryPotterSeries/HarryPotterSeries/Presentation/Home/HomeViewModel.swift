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
    @Published private(set) var selectedBook: Book?
    @Published private(set) var errorMessage: String?
    var formattedReleaseDate: String {
        selectedBook?.releaseDate.formattedDate(from: DateFormat.apiDate.rawValue,
                                                  to: DateFormat.displayDate.rawValue) ?? "-"
    }
    
    init(fetchBookUseCase: FetchBooksUseCase) {
        self.fetchBookUseCase = fetchBookUseCase
    }
    
    func loadBooks() {
        do {
            books = try fetchBookUseCase.execute()
            selectedBook = books[0]
        } catch let error as DataError {
            self.errorMessage = error.errorDescription
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
