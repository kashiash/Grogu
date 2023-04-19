//
//  AudioPlayer.swift
//  Grogu
//
//  Created by Jacek Kosinski U on 19/04/2023.
//


import SwiftUI
import AVFoundation

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var audioPlayer: AVAudioPlayer!
    
    func setupAudioPlayer(withFile file: String, type: String) {
        if let path = Bundle.main.path(forResource: file, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer.delegate = self
                audioPlayer.prepareToPlay()
            } catch {
                print("Error: Could not initialize audio player")
            }
        }
    }
    
    func play() {
        audioPlayer.play()
    }
    
    func pause() {
        audioPlayer.pause()
    }
    
    func stop() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
}
