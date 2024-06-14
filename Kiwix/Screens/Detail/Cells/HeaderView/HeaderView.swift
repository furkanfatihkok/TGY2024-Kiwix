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
    func setPlayButton(_ image: UIImage)
    func setVoiceButton(_ hidden: Bool, _ image: UIImage)
}

final class HeaderView: UIView {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var phonteticLabel: UILabel!
    @IBOutlet weak var voiceButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var headerPresenter: HeaderViewPresenterProtocol?
    
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
    
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        headerPresenter?.playButtonTapped()
        NotificationCenter.default.post(name: .playButtonTapped, object: nil)
    }
}

extension HeaderView: HeaderViewProtocol {
    
    func setWordLabel(_ word: String) {
        wordLabel.text = word
    }
    
    func setPhonteticLabel(_ phontetic: String) {
        phonteticLabel.text = phontetic
    }
    
    func setPlayButton(_ image: UIImage) {
        playButton.setImage(image, for: .normal)
    }
    
    func setVoiceButton(_ hidden: Bool, _ image: UIImage) {
        voiceButton.isHidden = hidden
        voiceButton.setImage(image, for: .normal)
    }
}
