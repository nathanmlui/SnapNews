//
//  ArticleCard.swift
//  PaperToWeb
//
//  Created by Nathan Lui on 2/8/21.
//

import SwiftUI
import UIKit

struct StoryCard: View {
    
    let story: Story
 
    var body: some View {
        VStack {
            Image(story.multimedia)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(story.title)
                        .font(Font.custom("NYTCheltenham-Bold", size: 30, relativeTo: .largeTitle))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(4)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 2)
                    
                    Text(story.abstract)
                        .font(Font.custom("NYTImperial-Regular", size: 16, relativeTo: .body))
                        .foregroundColor(.secondary)
                        .lineSpacing(1)
                        .padding(.bottom, 7)
                    
                    Text(formatDate(from: story.published_date).uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
                
            }
            .padding()
            
        }
        .cornerRadius(10)
        .background(Color.white)
        .compositingGroup()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
        .padding([.top, .horizontal])
        
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCard(story: Story.example)
    }
}
