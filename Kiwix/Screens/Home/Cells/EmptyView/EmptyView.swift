//
//  NoResultCell.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol EmptyViewProtocol: AnyObject{
    func setNoResult(_ text: String)
    func setDescriptionLabel(_ text: String)
}

final class EmptyView: UIView {
    
    @IBOutlet weak var noResult: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var presenter: EmptyViewPresenter?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNibView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureNibView()
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

extension EmptyView: EmptyViewProtocol {
    
    func setNoResult(_ text: String) {
        noResult.text = text
    }
    
    func setDescriptionLabel(_ text: String) {
        descriptionLabel.text = text
    }
    
}
