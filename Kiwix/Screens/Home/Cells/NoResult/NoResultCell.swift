//
//  NoResultCell.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol NoResultCellProtocol: AnyObject{
    func setNoResult(_ text: String)
    func setDescriptionLabel(_ text: String)
}

class NoResultCell: UIView {
    
    @IBOutlet weak var noResult: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var cellPresenter: NoResultCellPresenterProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNibView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureNibView()
    }
    
    func configure(with presenter: NoResultCellPresenterProtocol) {
        self.cellPresenter = presenter
        self.cellPresenter?.load()
    }
    
    private func loadViewFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: .main)
        return nib.instantiate(withOwner: self).first as? UIView
    }
    
    private func configureNibView() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
    }
}

extension NoResultCell: NoResultCellProtocol {
    
    func setNoResult(_ text: String) {
        noResult.text = text
    }
    
    func setDescriptionLabel(_ text: String) {
        descriptionLabel.text = text
    }
    
}
