//
//  ContentView.swift
//  Grogu
//
//  Created by Jacek Kosinski U on 19/04/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var audioPlayer = AudioPlayer()

    // List of audio files
    private let audioFiles = [
        "yes",
        "no",
        "bad"
    ]
    
    var body: some View {
        ZStack {
            // Background image
            Image("grogu")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    ForEach(audioFiles, id: \.self) { file in
                        AnimatedButton(file: file, action: {
                            playAudio(file: file)
                              
                        })
                        .opacity(0.5)
                        
                        
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
        .onTapGesture {
            playAudio(file: "main")
        }
    }
    
    private func playAudio(file: String) {
        audioPlayer.stop()
        audioPlayer.setupAudioPlayer(withFile: file)
        audioPlayer.play()
    }
}


