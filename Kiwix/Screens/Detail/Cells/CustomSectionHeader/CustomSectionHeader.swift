//
//  CustomSectionHeader.swift
//  Kiwix
//
//  Created by FFK on 9.06.2024.
//

import UIKit

protocol CustomSectionHeaderProtocol: AnyObject {
    func setNumberLabel(_ text: String)
    func setPartOfSpeechLabel(_ text: String)
}

final class CustomSectionHeader: UITableViewHeaderFooterView {

    static let identifier = "CustomSectionHeader"
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var partOfSpeechLabel: UILabel!

}

extension CustomSectionHeader: CustomSectionHeaderProtocol {
    
    func setNumberLabel(_ text: String) {
        numberLabel.text = text
    }
    
    func setPartOfSpeechLabel(_ text: String) {
        partOfSpeechLabel.text = text
    }
    
}
