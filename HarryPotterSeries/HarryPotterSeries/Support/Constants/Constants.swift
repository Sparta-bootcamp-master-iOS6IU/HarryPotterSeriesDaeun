//
//  Constants.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/28/25.
//

import Foundation

enum AlertTitle {
    static let networkError = "네트워크 오류"
}

enum AlertActionTitle {
    static let check = "확인"
}

enum BookCoverImage {
    static let harrypotter = "harrypotter"
}

enum DateFormat: String {
    case apiDate = "yyyy-mm-dd"
    case displayDate = "MMMM dd, yyyy"
}

enum SectionTitle {
    static let author = "Author"
    static let releasedDate = "ReleasedDate"
    static let pages = "Pages"
    static let dedication = "Dedication"
    static let summary = "Summary"
    static let chapter = "Chapter"
}

enum ButtonTitle {
    static let fold = "접기"
    static let expand = "더 보기"
}

enum BookSpacing {
    static let horizontal: CGFloat = 20
    static let vertical: CGFloat = 24
    static let labelToLabel: CGFloat = 8
}

enum BookFontSize {
    static let title1: CGFloat = 18
    static let title2: CGFloat = 14
    static let content: CGFloat = 14
}

enum CommonString {
    static let ellipsis = "..."
}

enum BookNumber {
    static let shortSummary = 450
}

enum UserDefaultsKey {
    static let summaryExpandState = "summaryExpandState"
}
