//
//  SearchRepositoryProtocol.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

protocol SearchRepositoryProtocol {
    func search(with word: String) async throws -> Search
}
