//
//  Book.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/27/25.
//

struct Book: Codable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wikiURL: String
    let chapters: [Chapter]
    
    enum CodingKeys: String, CodingKey {
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
