//
//  BookRepository.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/27/25.
//

import Foundation

protocol BookRepository {
    func fetchBooks() throws -> [Book]
}
