//
//  ButtonCell.swift
//  Kiwix
//
//  Created by FFK on 10.06.2024.
//

import UIKit

final class ButtonView: UIView {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nounButton: UIButton!
    @IBOutlet weak var verbButton: UIButton!
    @IBOutlet weak var adjectiveButton: UIButton!
    
    var presenter: ButtonViewPresenterProtocol?
    
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
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        presenter?.cancelButtonPressed()
        cancelButton.isHidden = true
    }
    
    @IBAction func nounButtonAction(_ sender: UIButton) {
        presenter?.nounButtonPressed()
        cancelButton.isHidden = false
    }
    
    @IBAction func verbButtonAction(_ sender: UIButton) {
        presenter?.verbButtonPressed()
        cancelButton.isHidden = false
    }
    
    @IBAction func adjectiveButtonAction(_ sender: UIButton) {
        presenter?.adjectiveButtonPressed()
        cancelButton.isHidden = false
    }
}

