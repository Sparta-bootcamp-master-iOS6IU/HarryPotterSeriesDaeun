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
    @Published private(set) var selectedBook: Book!
    @Published private(set) var errorMessage: String?
    @Published private(set) var summaryText: String?
    @Published private(set) var showToggleButton: Bool?
    
    init(fetchBookUseCase: FetchBooksUseCase) {
        self.fetchBookUseCase = fetchBookUseCase
    }
    
    // TODO: 다른 책 선택 확인용, 삭제 예정
    func change() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self else { return }
            selectedBook = books[1]
            updateSummaryInfo(for: selectedBook)
        }
    }
    
    func loadBooks() {
        do {
            books = try fetchBookUseCase.execute()
            selectedBook = books[0]
            updateSummaryInfo(for: selectedBook)
        } catch let error as DataError {
            self.errorMessage = error.errorDescription
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    private func updateSummaryInfo(for book: Book) {
        if book.summary.count > BookNumber.shortSummary {
            summaryText = String(book.summary.prefix(BookNumber.shortSummary)) + CommonString.ellipsis
            showToggleButton = true
        } else {
            summaryText = book.summary
            showToggleButton = false
        }
    }
}
