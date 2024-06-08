//
//  CustomSection.swift
//  Kiwix
//
//  Created by FFK on 8.06.2024.
//

import UIKit

protocol CustomSectionProtocol: AnyObject {
    func setSectionTitle(_ text: String)
    func setNumberOfSection(_ number: String)
}

final class CustomSection: UIView {
    
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var numberOfSection: UILabel!
    
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

extension CustomSection: CustomSectionProtocol {
    
    func setSectionTitle(_ text: String) {
        sectionTitle.text = text
    }
    
    func setNumberOfSection(_ number: String) {
        numberOfSection.text = number
    }
}
