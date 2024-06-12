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
    func showExampleStackView(_ show: Bool)
}

final class WordCell: UITableViewCell {
    
    static let identifier = "WordCell"
    
    @IBOutlet weak var definationLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var exampleStackView: UIStackView!
    
    var cellPresenter: WordCellPresenterProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        definationLabel.preferredMaxLayoutWidth = definationLabel.frame.width
//        exampleLabel.preferredMaxLayoutWidth = exampleLabel.frame.width
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with presenter: WordCellPresenterProtocol) {
        self.cellPresenter = presenter
        self.cellPresenter?.load()
    }
    
}

extension WordCell: WordCellProtocol {
    
    func setDefinationLabel(_ text: String) {
        definationLabel.text = text
    }
    
    func setExampleLabel(_ text: String) {
        exampleLabel.text = text
    }
    
    func showExampleStackView(_ show: Bool) {
        exampleStackView.isHidden = !show
    }
}
