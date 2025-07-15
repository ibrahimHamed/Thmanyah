//
//  HomeUseCaseProtocol.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

protocol HomeUseCaseProtocol {
    func fetchHome(page: Int) async throws -> Home
}
