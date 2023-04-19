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
    
    var body: some View {
        ZStack {
            // Background image
            Image("grogu")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.clear)
                    .frame(maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        playAudio(file: "main")
                    }
                
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            playAudio(file: "yes")
                        }
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            playAudio(file: "no")
                        }
                }
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        playAudio(file: "bad")
                    }
            }
        }
    }
    
    private func playAudio(file: String) {
        audioPlayer.stop()
        audioPlayer.setupAudioPlayer(withFile: file)
        audioPlayer.play()
    }
}


