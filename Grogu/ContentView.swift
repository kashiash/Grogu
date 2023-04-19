//
//  ContentView.swift
//  Grogu
//
//  Created by Jacek Kosinski U on 19/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var audioPlayer = AudioPlayer()

    // List of audio files
    private let audioFiles = [
        ("yes", "mp3"),
        ("no", "mp3"),
        ("bad", "mp3")
    ]
    
    var body: some View {
        VStack {
            Text("Audio Player")
                .font(.largeTitle)
            
            VStack {
                ForEach(audioFiles, id: \.0) { file, type in
                    Button(action: {
                        playAudio(file: file, type: type)
                    }) {
                        Text("Play \(file)")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10)
                }
            }
            .padding()
        }
    }
    
    private func playAudio(file: String, type: String) {
        audioPlayer.stop()
        audioPlayer.setupAudioPlayer(withFile: file, type: type)
        audioPlayer.play()
    }
}
