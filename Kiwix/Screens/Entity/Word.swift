//
//  DictionaryModel.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

struct Word: Decodable {
    let word: String
    let phonetics: [Phonetics]
    let meanings: [Meanings]
}

struct Phonetics: Decodable {
    let text: String
    let audio: String?
}

struct Meanings: Decodable {
    let partOfSpeech: String
    let definations: [Defination]
}

struct Defination: Decodable {
    let definition: String
    let example: String?
}
