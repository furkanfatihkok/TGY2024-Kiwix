//
//  HeaderViewPresenter.swift
//  Kiwix
//
//  Created by FFK on 8.06.2024.
//

import UIKit
import AVFoundation

protocol HeaderViewPresenterProtocol {
    func playButtonTapped()
    func load()
}

final class HeaderViewPresenter {
    
    weak var view: HeaderViewProtocol?
    var audioPlayer: AVAudioPlayer?
    var phonetics: Phonetics?
    
    init(view: HeaderViewProtocol, phonetics: Phonetics? ) {
        self.view = view
        self.phonetics = phonetics
    }
}

extension HeaderViewPresenter: HeaderViewPresenterProtocol {
    
    func playButtonTapped() {
        print("playButton tapped")
        
        guard let audioUrlString = phonetics?.audio else {
            print("Audio URL is nil")
            return
        }
        
        guard let audioUrl = URL(string: audioUrlString) else {
            print("Invalid audio URL")
            return
        }
        
        do {
            let audioData = try Data(contentsOf: audioUrl)
            audioPlayer = try AVAudioPlayer(data: audioData)
            audioPlayer?.play()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }
    
    func load() {
        if let phonetics = phonetics, let audioUrlString = phonetics.audio, URL(string: audioUrlString) != nil {
            view?.setVoiceButton(false, UIImage(systemName: "speaker.wave.3.fill") ?? UIImage())
            if let playImage = UIImage(systemName: "play.fill") {
                view?.setPlayButton(playImage)
            }
        } else {
            view?.setVoiceButton(true, UIImage())
            if let noAudioImage = UIImage(systemName: "play.slash") {
                view?.setPlayButton(noAudioImage)
            }
        }
    }
}
