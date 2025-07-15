//
//  HomeRepositoryProtocol.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

protocol HomeRepositoryProtocol {
    func fetchHome(page: Int) async throws -> Home
}
