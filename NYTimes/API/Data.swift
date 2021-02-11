//
//  Data.swift
//  NYTimes
//
//  Created by Максим Нечеперунко on 11.02.2021.
//

import Foundation


struct PurpleData: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let title: String
}
