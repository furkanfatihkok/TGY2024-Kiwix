//
//  RecentSection.swift
//  Kiwix
//
//  Created by FFK on 10.06.2024.
//

import UIKit

protocol RecentSectionViewProtocol: AnyObject {
    func setNumberLabel(_ text: String)
}

final class RecentSection: UITableViewHeaderFooterView {

    static let identifier = "RecentSection"

    @IBOutlet weak var numberLabel: UILabel!
    
}

extension RecentSection: RecentSectionViewProtocol {
    
    func setNumberLabel(_ text: String) {
        numberLabel.text = text
    }
    
}
