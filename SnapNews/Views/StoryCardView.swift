//
//  ResultView.swift
//  SnapNews
//
//  Created by Nathan Lui on 2/15/21.
//


import SwiftUI

struct StoryCardView: View {
    
    @Environment(\.openURL) var openURL
    @ObservedObject private var dataStore: DataStore
    var recognizedText =  ""
    var firstDoc: Doc? { return dataStore.result?.response.docs.first } //Store the path of the first doc in a variable for concise text below
    
    init (dataStore: DataStore, recognizedText: String) {
        self.dataStore = dataStore
        self.recognizedText = recognizedText
    }
    
    var body: some View {
        
        // If there are no results, then show NoResultsView
        if dataStore.result?.response.meta.hits == 0 {
            NoResultsView()
        }
        
        else {
            
            VStack (spacing: 40) {
                
                VStack {
                    
                    let jsonURL = String((firstDoc?.multimedia[optional: 0]?.url) ?? "")
                    
                    RemoteImage(url: jsonURL)
                        .aspectRatio(contentMode: .fit)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            
                            // If there is no print headline, then return the main headline instead
                            if (firstDoc?.headline.printHeadline == nil) {
                                Text(firstDoc?.headline.main ?? "")
                                    .font(Font.custom("NYTCheltenham-Bold", size: 26, relativeTo: .largeTitle))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black) // was .primary
                                    .lineSpacing(0.8)
                                    .lineLimit(4)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                            } else {
                                        Text(firstDoc?.headline.printHeadline ?? "")
                                            .font(Font.custom("NYTCheltenham-Bold", size: 26, relativeTo: .largeTitle))
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black) // was .primary
                                            .lineSpacing(0.8)
                                            .lineLimit(4)
                                            .fixedSize(horizontal: false, vertical: true)
                            }
                            
                            Text(firstDoc?.abstract ?? "")
                                .font(Font.custom("NYTImperial-Regular", size: 16, relativeTo: .body))
                                .foregroundColor(Color("darkGray")) // was .secondary
                                .lineSpacing(2)
                                .lineLimit(4)
                            
                            Text(formatDate(from: firstDoc?.pubDate ?? "").uppercased())
                                .font(.caption)
                                .foregroundColor(.gray) // was .secondary
                            
                        }
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .layoutPriority(100)
                        .padding()
                        
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1))
                .cornerRadius(10)
                .background(Color.white)
                .compositingGroup()
                .padding([.top, .horizontal])
               
                
                
                Button(action: openArticleURL) {
                    HStack {
                        Text("Read online")
                            .font(.headline)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.up.forward.app")
                            .foregroundColor(.white)
                            .font(Font.headline.weight(.light))
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 20)
                }
                .background(Color(.blue))
                .cornerRadius(6)
                
            }
            
        }
        
        Spacer()
        
        //Recognized text confirmation
        HStack{
                
            Image(systemName: "info.circle")
                .font(Font.headline.weight(.light))
                .font(.system(size: 25))
                .padding(.leading)
                //.foregroundColor(Color("darkGray"))
            
            VStack (alignment: .leading) {
                Text("Result found using the scanned text:")
                    .font(.system(size: 11))
                    .fontWeight(.medium)
                    //.foregroundColor(Color("darkGray"))
                Text(recognizedText.replacingOccurrences(of: "\n", with: " "))
                    .font(.system(size: 11))
                    .lineLimit(1)
                    //.foregroundColor(Color("darkGray"))
            }
            
            Spacer()
        }
        .foregroundColor(Color("darkGray"))
    }
    
    
    func openArticleURL() {
        guard let url = URL(string: firstDoc?.webURL ?? "http://www.nytimes.com") else {
            return
        }
        openURL(url)
    }
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (optional index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
