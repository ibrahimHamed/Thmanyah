//
//  SearchUseCaseProtocol.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

protocol SearchUseCaseProtocol {
    func search(with word: String) async throws -> Search
}
