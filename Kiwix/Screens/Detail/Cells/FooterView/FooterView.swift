//
//  FooterView.swift
//  Kiwix
//
//  Created by FFK on 12.06.2024.
//

import UIKit

final class FooterView: UIView {
    
    @IBOutlet weak var synonymOne: UILabel!
    @IBOutlet weak var synonymTwo: UILabel!
    @IBOutlet weak var synonymThree: UILabel!
    @IBOutlet weak var synonymFour: UILabel!
    @IBOutlet weak var synonymFive: UILabel!
    
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
