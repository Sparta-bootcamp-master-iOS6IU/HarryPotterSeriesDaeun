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
            let books = bookResponse.data.map { $0.attributes }
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
