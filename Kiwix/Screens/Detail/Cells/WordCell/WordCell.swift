//
//  WordCell.swift
//  Kiwix
//
//  Created by FFK on 9.06.2024.
//

import UIKit

protocol WordCellProtocol: AnyObject {
    func setDefinationLabel(_ text: String)
    func setExampleLabel(_ text: String)
}

final class WordCell: UITableViewCell {
    
    static let identifier = "WordCell"
    
    @IBOutlet weak var definationLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    
    var cellPresenter: WordCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension WordCell: WordCellProtocol {
    
    func setDefinationLabel(_ text: String) {
        definationLabel.text = text
    }
    
    func setExampleLabel(_ text: String) {
        exampleLabel.text = text
    }
    
}
