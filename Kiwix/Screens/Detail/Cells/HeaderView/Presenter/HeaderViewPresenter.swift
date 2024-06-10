//
//  HeaderViewPresenter.swift
//  Kiwix
//
//  Created by FFK on 8.06.2024.
//

import UIKit
import AVFoundation

protocol HeaderViewPresenterProtocol {
    func audioButtonTapped()
    func setAudioURL(_ url: URL?)
}

final class HeaderViewPresenter {
    
    weak var view: HeaderViewProtocol!
    private var audioPlayer: AVAudioPlayer?
    private var audioURL: URL?
    
    init(view: HeaderViewProtocol) {
        self.view = view
    }
    
    private func playAudio() {
        guard let url = audioURL else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}

extension HeaderViewPresenter: HeaderViewPresenterProtocol {
    func audioButtonTapped() {
        playAudio()
        view.setVoiceButton(UIImage(systemName: "speaker.fill")!)
    }
    
    func setAudioURL(_ url: URL?) {
        self.audioURL = url
    }
}

