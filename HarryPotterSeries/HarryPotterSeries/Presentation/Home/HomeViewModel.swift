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
    @Published private(set) var showExpandButton: Bool = false
    @Published private(set) var isExpandedSummary: Bool!
    
    private var isLongSummary: Bool {
        selectedBook.summary.count > BookNumber.shortSummary
    }
    
    private var shortenedSummary: String {
        guard isLongSummary else { return selectedBook.summary }
        return String(selectedBook.summary.prefix(BookNumber.shortSummary)) + CommonString.ellipsis
    }
    
    init(fetchBookUseCase: FetchBooksUseCase) {
        self.fetchBookUseCase = fetchBookUseCase
        isExpandedSummary = self.loadExpandState()
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
        showExpandButton = isLongSummary
        updateSummaryText()
    }
    
    func toggleExpandButton() {
        isExpandedSummary.toggle()
        updateSummaryText()
        saveExpandState(isExpanded: isExpandedSummary)
    }
    
    private func updateSummaryText() {
        summaryText = isExpandedSummary ? selectedBook.summary : shortenedSummary
    }
    
    func saveExpandState(isExpanded: Bool) {
        UserDefaults.standard.set(isExpanded, forKey: UserDefaultsKey.summaryExpandState)
    }
    
    func loadExpandState() -> Bool {
        UserDefaults.standard.bool(forKey: UserDefaultsKey.summaryExpandState)
    }
    
    func isTappedSeriesButton(of index: Int) {
        selectedBook = books[index]
        updateSummaryInfo(for: selectedBook)
    }
}
