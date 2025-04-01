//
//  DataSource.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/27/25.
//

import Foundation

final class DataService {
    func fetchBooks() throws -> [Book] {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            throw DataError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
            let books = bookResponse.data.enumerated().map { index, data in
                let attributes = data.attributes
                return Book(seriesNumber: index + 1,
                            title: attributes.title,
                            author: attributes.author,
                            pages: attributes.pages,
                            releaseDate: attributes.releaseDate,
                            dedication: attributes.dedication,
                            summary: attributes.summary,
                            wikiURL: attributes.wikiURL,
                            chapters: attributes.chapters)
            }
            return books
        } catch {
            throw DataError.parsingFailed
        }
    }
}

enum DataError: Error {
    case fileNotFound
    case parsingFailed
    
    var errorDescription: String {
        switch self {
        case .fileNotFound:
            return "데이터 파일을 찾을 수 없습니다."
        case .parsingFailed:
            return "데이터를 불러오는 데 실패했습니다."
        }
    }
}
