//
//  Book.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/27/25.
//

struct Book: Codable {
    var seriesNumber: Int? = nil
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wikiURL: String
    let chapters: [Chapter]
    
    enum CodingKeys: String, CodingKey {
        case seriesNumber
        case title
        case author
        case pages
        case releaseDate = "release_date"
        case dedication
        case summary
        case wikiURL = "wiki"
        case chapters
    }
}

extension Book {
    var formattedReleasedDate: String {
        releaseDate.formattedDate(from: DateFormat.apiDate.rawValue,
                                  to: DateFormat.displayDate.rawValue) ?? "-"
    }
    
    var coverImageName: String {
        BookCoverImage.harrypotter + String(seriesNumber!)
    }
}
