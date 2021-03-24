//
//  test.swift
//  PaperToWeb
//
//  Created by Nathan Lui on 2/8/21.
//

//: A UIKit based Playground for playing with SwiftUI
// @fitomad
  
import UIKit
import SwiftUI

struct RoundedShadowView: View
{
    var body: some View
    {
        VStack(alignment: HorizontalAlignment.leading, spacing: 10.0)
        {
            Text("SHADOW & CORNER")
                .padding(EdgeInsets(top: 8.0, leading: 8.0, bottom: 0.0, trailing: 8.0))
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text("SwiftUI")
                .padding(8)
                .foregroundColor(.primary)
            
            Text("Vamos a crear una `View` que proyectará una sombra y además tendra las esquinas redondeadas.\n\nEsto con UIKit implicaba crear una vista auxiliar que proyectaba la sombra mientras que redondeabas las esquinas del componente *principal*")
                .padding(EdgeInsets(top: 0.0, leading: 8.0, bottom: 8.0, trailing: 8.0))
                .lineLimit(nil)
                .lineSpacing(5)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

struct Container: View
{
    var body: some View
    {
        VStack
        {
            // Añade la sombra a toda la `View`
            RoundedShadowView()
                .background(Color.white)
                .cornerRadius(8)
                .padding(32)
                .shadow(color: Color.blue, radius: 20)
            
            // En esta 'View' sin embargo el sombreado y
            // redondeo se aplica a las `View` que están contenidas.
            // Aplicar `.background(Color.clear)` tampoco funciona según lo esperado
            RoundedShadowView()
                .cornerRadius(8)
                .padding(32)
                .shadow(color: Color.blue, radius: 20)
        }
    }
}

// Present the view controller in the Live View window
let hostController = UIHostingController(rootView: Container())
PlaygroundPage.current.liveView = hostController
