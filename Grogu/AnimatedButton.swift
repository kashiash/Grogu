//
//  AnimatedButton.swift
//  Grogu
//
//  Created by Jacek Kosinski U on 19/04/2023.
//

import SwiftUI

struct AnimatedButton: View {
    let file: String
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                isPressed.toggle()
            }
            action()
        }) {
            Text("Play \(file)")
                .font(.title)
                .foregroundColor(.white)
                .frame(minWidth: 100, minHeight: 100)
                .background(Color.blue)
                .clipShape(Circle())
                .scaleEffect(isPressed ? 0.9 : 1)
                .animation(.spring(), value: isPressed)
        }
    }
}

