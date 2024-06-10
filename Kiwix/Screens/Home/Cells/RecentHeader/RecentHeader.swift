//
//  RecentHeader.swift
//  Kiwix
//
//  Created by FFK on 10.06.2024.
//

import UIKit

protocol SectionHeaderViewProtocol: AnyObject {
    func setNumberLabel(_ text: String)
}

final class RecentHeader: UITableViewHeaderFooterView {

    static let identifier = "RecentHeader"

    @IBOutlet weak var numberLabel: UILabel!
    
}

extension RecentHeader: SectionHeaderViewProtocol {
    
    func setNumberLabel(_ text: String) {
        numberLabel.text = text
    }
    
}
