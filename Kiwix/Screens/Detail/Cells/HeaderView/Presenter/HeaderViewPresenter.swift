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
}

final class HeaderViewPresenter {
    
    weak var view: HeaderViewProtocol!
    var audioPlayer: AVAudioPlayer?
    var phonetics: Phonetics?
    
    init(view: HeaderViewProtocol!, audioPlayer: AVAudioPlayer?, phonetics: Phonetics? ) {
        self.view = view
        self.audioPlayer = audioPlayer
        self.phonetics = phonetics
    }
}

extension HeaderViewPresenter: HeaderViewPresenterProtocol {
    
    func playButtonTapped() {
        guard let audioUrlString = phonetics?.audio else {
            print("Audio URL is nil")
            return
        }
        
        guard let audioUrl = URL(string: audioUrlString) else {
            print("Invalid audio URL")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            audioPlayer?.play()
        } catch {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }
    
}
