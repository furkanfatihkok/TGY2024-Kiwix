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
}

final class HeaderView: UIView {
    
    static let identifier = "HeaderView"
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var phonteticLabel: UILabel!
    @IBOutlet weak var voiceButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
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
    
}
