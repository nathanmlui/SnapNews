//
//  AnimatedBackground.swift
//  SnapNews
//
//  Created by Nathan Lui on 3/19/21.
//

import SwiftUI

struct AnimatedBackground: View {
   
    @State private var scale: CGFloat = 1
    @State private var angle: Double = 1
    
    var body: some View {
        Image("corners")
            .rotationEffect(.degrees(angle))
        .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            
            .onAppear() {
                self.scale += 0.03
            }
        
    }
}

struct AnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackground()
    }
}
