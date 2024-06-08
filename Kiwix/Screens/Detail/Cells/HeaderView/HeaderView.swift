//
//  HeaderView.swift
//  Kiwix
//
//  Created by FFK on 8.06.2024.
//

import UIKit

protocol HeaderViewProtocol: AnyObject {
    func setWordLabel(_ word: String)
    func setPhonteticLabel(_ phontetic: String)
    func setVoiceButton(_ systemName: UIImage)
    func setPlayButton(_ systemName: UIImage)
    func setXmarkButton(isHidden: Bool)
    func setNounButton(title: String, borderColor: UIColor)
    func setVerbButton(isHidden: Bool, borderColor: UIColor)
    func setAdjectiveButton(isHidden: Bool, borderColor: UIColor)
}

final class HeaderView: UIView {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var phonteticLabel: UILabel!
    @IBOutlet weak var voiceButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var xmarkButton: UIButton!
    @IBOutlet weak var nounButton: UIButton!
    @IBOutlet weak var verbButton: UIButton!
    @IBOutlet weak var adjectiveButton: UIButton!
    
    var presenter: HeaderViewPresenterProtocol?
    
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
    
    @IBAction func audioButton(_ sender: UIButton) {
        presenter?.audioButtonTapped()
    }
    
    @IBAction func xmarkButtonAction(_ sender: UIButton) {
        presenter?.xmarkButtonTapped()
    }
    
    @IBAction func nounButtonAction(_ sender: UIButton) {
        presenter?.nounButtonTapped()
    }
    
    @IBAction func verbButtonAction(_ sender: UIButton) {
        presenter?.verbButtonTapped()
    }
    
    @IBAction func adjectiveButtonAction(_ sender: UIButton) {
        presenter?.adjectiveButtonTapped()
    }
}

extension HeaderView: HeaderViewProtocol {
    
    func setWordLabel(_ word: String) {
        wordLabel.text = word
    }
    
    func setPhonteticLabel(_ phontetic: String) {
        phonteticLabel.text = phontetic
    }
    
    func setVoiceButton(_ systemName: UIImage) {
        voiceButton.setImage(systemName, for: .normal)
    }
    
    func setPlayButton(_ systemName: UIImage) {
        playButton.setImage(systemName, for: .normal)
    }
    
    func setXmarkButton(isHidden: Bool) {
        xmarkButton.isHidden = isHidden
    }
    
    func setNounButton(title: String, borderColor: UIColor) {
        nounButton.setTitle(title, for: .normal)
        nounButton.layer.borderColor = borderColor.cgColor
    }
    
    func setVerbButton(isHidden: Bool, borderColor: UIColor) {
        verbButton.isHidden = isHidden
        verbButton.layer.borderColor = borderColor.cgColor
    }
    
    func setAdjectiveButton(isHidden: Bool, borderColor: UIColor) {
        adjectiveButton.isHidden = isHidden
        adjectiveButton.layer.borderColor = borderColor.cgColor
    }
    
}