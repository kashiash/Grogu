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
    
    func setupAudioPlayer(withFile file: String) {
        if let asset = NSDataAsset(name: file) {
            do {
                audioPlayer = try AVAudioPlayer(data: asset.data, fileTypeHint: AVFileType.mp3.rawValue)
                audioPlayer.delegate = self
                audioPlayer.prepareToPlay()
            } catch {
                print("Error: Could not initialize audio player")
            }
        } else {
            print("Error: Could not find the audio asset \(file)")
        }
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func pause() {
        audioPlayer?.pause()
    }
    
    func stop() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
}

