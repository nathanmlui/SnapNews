//
//  NoResultsView.swift
//  SnapNews
//
//  Created by Nathan Lui on 3/23/21.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        
        VStack {
            
            Image("NoResult")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .padding(.bottom, 30)
            
            Text("There were no results for your search")
                .font(Font.custom("Lato Bold", size: 18, relativeTo: .headline))
                .multilineTextAlignment(.center)
                .foregroundColor(.black) // was .primary
            Text("This can happen if the image was poor or if the article doesn't yet exist at NYTimes.com")
                .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                .multilineTextAlignment(.center)
                .foregroundColor(.black) // was .primary
                .padding()
            
        }
        
        
    }
}

struct NoResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultsView()
    }
}
