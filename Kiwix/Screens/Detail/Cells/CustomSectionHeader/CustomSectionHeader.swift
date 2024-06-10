//
//  CustomSectionHeader.swift
//  Kiwix
//
//  Created by FFK on 9.06.2024.
//

import UIKit

final class CustomSectionHeader: UITableViewHeaderFooterView {

    static let identifier = "CustomSectionHeader"
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var partOfSpeechLabel: UILabel!

}
