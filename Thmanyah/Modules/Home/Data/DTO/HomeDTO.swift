//
//  HomeSectionsResponse.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

struct HomeDTO: Codable {
    var sections: [HomeSectionDTO]?
    var pagination: HomePaginationDTO?
}
