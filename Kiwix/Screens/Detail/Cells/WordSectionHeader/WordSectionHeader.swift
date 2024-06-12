//
//  WordSectionHeader.swift
//  Kiwix
//
//  Created by FFK on 9.06.2024.
//

import UIKit

protocol WordSectionHeaderProtocol: AnyObject {
    func setNumberLabel(_ text: String)
    func setPartOfSpeechLabel(_ text: String)
}

final class WordSectionHeader: UITableViewHeaderFooterView {

    static let identifier = "WordSectionHeader"
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var partOfSpeechLabel: UILabel!

}

extension WordSectionHeader: WordSectionHeaderProtocol {
    
    func setNumberLabel(_ text: String) {
        numberLabel.text = text
    }
    
    func setPartOfSpeechLabel(_ text: String) {
        partOfSpeechLabel.text = text
    }
    
}
