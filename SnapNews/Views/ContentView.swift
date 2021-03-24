//
//  ContentView.swift
//  SnapNews
//
//  Created by Nathan Lui on 2/8/21.
//

import SwiftUI
import Combine
import Foundation

struct ContentView: View {
    
    @State var showingScanningView = false
    @State var bottomSheetShown = false
    @State var hasSearched = false // Track whether user has taken a photo
    @State var recognizedText = "Scan a New York Times headline to view it online"
    @State private var showingSheet = false
    
    private let dataStore = DataStore()
    
    init () {
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            //More info button
            HStack {
                Spacer ()
                Button(action: {
                    showingSheet.toggle()
                }) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.gray)
                        .font((.system(size: 24)))
                
                }
                .padding()
                .sheet(isPresented: $showingSheet) {
                    HelpSheetView()
                }
            }
            
                        

            VStack {
                
                VStack {
                   
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("Scan a New York Times print headline to view it online")
                            .font(Font.custom("Lato Bold", size: 24, relativeTo: .headline))
                            .multilineTextAlignment(.center)
                            .lineSpacing(2)
                            .padding()
                        
                         
                        Spacer()
                    }
                    
                    
                    VStack {
                        Button(action: {
                            self.showingScanningView = true
                        }) {
                            HStack {
                                Text("Scan a headline")
                                    .font(Font.headline)
                                Image(systemName: "doc.text.viewfinder")
                                    .foregroundColor(.white)
                                    .font(Font.headline.weight(.regular))
                            }
                            .padding(.horizontal, 50)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background((Color.blue))
                        .cornerRadius(4)
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .padding(.bottom, 100)
                
            }
            .sheet(isPresented: $showingScanningView) {
                ScanDocumentView(recognizedText: self.$recognizedText)
            }
            // When recognizedText changes, get NYTimes article with newText
            .onChange(of: recognizedText, perform: { newText in
                
                self.hasSearched = true
                
                //Pass this newText to the get results function
                dataStore.getResults(for: recognizedText)
                
                //Open the bottom sheet that contains the article
                self.bottomSheetShown = true
            })
            
            
            
            
            BottomSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 1
                ) {
                    VStack(alignment: .center)  {
                        Spacer()
                        
                        if (hasSearched == false) {
                            HasNotSearchedView()
                        }
                        
                        else {
                            StoryCardView(dataStore: dataStore, recognizedText: recognizedText)
                        }
                        
                        Spacer()
                    }
                }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(.secondarySystemBackground).edgesIgnoringSafeArea(.all))
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
