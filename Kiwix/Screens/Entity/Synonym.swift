//
//  SynonymModel.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

struct Synonym: Decodable {
    let word: String
    let score: Int
}
