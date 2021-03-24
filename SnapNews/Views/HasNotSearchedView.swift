//
//  HasNotSearchedView.swift
//  SnapNews
//
//  Created by Nathan Lui on 3/22/21.
//

import SwiftUI

struct HasNotSearchedView: View {
    var body: some View {
        
        VStack (alignment: .center, spacing: 20) {
            
            Image("PaperToWebEmptyState")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 10)
            
            Text("Online articles appear here after you scan and save a print headline")
                .font(Font.custom("Lato Regular", size: 18, relativeTo: .subheadline))
                .foregroundColor(.black) // was .primary
                .lineSpacing(2)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.bottom, 40)
            
           

        }
        .padding()
        
    }
}

struct HasNotSearchedView_Previews: PreviewProvider {
    static var previews: some View {
        HasNotSearchedView()
    }
}
