//
//  Pokemon.swift
//  Pokemon
//
//  Created by iOSLab on 05/04/25.
//

import Foundation

struct ResponseList: Decodable {
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Identifiable, Decodable {
    let id = UUID()
    let name: String
}
