//
//  HelpSheetView.swift
//  SnapNews
//
//  Created by Nathan Lui on 3/23/21.
//

import SwiftUI
import Combine
import Foundation

struct HelpSheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font((.system(size: 24)))
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                //Spacer()
            }
            
            VStack {
                
                Image("NewspaperBoxed")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .padding(.vertical, 30)
                
                VStack ( alignment: .leading) {
                    
                    Text("How it works")
                        .font(Font.custom("Lato Bold", size: 18, relativeTo: .headline))
                        .padding(.vertical, 0.5)
                        
                    
                    Text("SnapNews uses optical character recognition to extract text from an image. It then uses this text to search for an article on NYTimes.com.")
                        .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                        .fixedSize(horizontal: false, vertical: true)
                            
                    
                    Text("What to do")
                        .font(Font.custom("Lato Bold", size: 18, relativeTo: .headline))
                        .padding(.vertical, 0.5)
                        .padding(.top, 25)
                    
                    VStack (alignment: .leading, spacing: 2) {
                        
                        HStack {
                            Text("1.")
                                .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("Take a photo of a headline")
                                .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        HStack (alignment: .top) {
                            Text("2.")
                                .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("Adjust the crop box to highlight only the  headline text")
                                .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        HStack (alignment: .top) {
                            Text("3.")
                                .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("Select Save")
                                .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                                .fixedSize(horizontal: false, vertical: true)
                        }
    
                    }
                    
                    
                    
                    Text("How to get good results")
                        .font(Font.custom("Lato Bold", size: 18, relativeTo: .headline))
                        .padding(.vertical, 0.5)
                        .padding(.top, 25)
                    Text("Make sure the image is well-lit (use the flash if necessary). Only include the headline in the photo and crop out all other lines and characters. Scan the headline in portrait (not landscape) orientation.")
                        .font(Font.custom("Lato Regular", size: 16, relativeTo: .body))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                
            }
        
            Spacer()
        }
        
    
    }
}

struct HelpSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HelpSheetView()
    }
}
