//
//  GetData.swift
//  SnapNews
//
//  Created by Nathan Lui on 3/9/21.
//
// Make the API call with the formed url

import Foundation
import UIKit

func getData(with searchTerm: String, completion: @escaping (NYTSearchResponse) -> ()) {
    
    //Form a url with our extracted text
    let APIKey = "aMppbpNI76ep8OeGEGDOt9ND2rnSdh0c"
    
    // Remove the spaces and convert them to percents
    guard let encodedSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
        
        print("Error encoding search term in URL")
        return
    }

    let url = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=" + encodedSearchTerm + "&api-key=" + APIKey
    
   // With the formed url, start the data task
    let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
        
        guard let data = data, error == nil else {
            print("Error loading data")
            return
        }
        
        do {
            
            let result = try JSONDecoder().decode(NYTSearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result)
                }
            
            
        } catch {
            print(error)
        }
    })
    
    task.resume()
}

