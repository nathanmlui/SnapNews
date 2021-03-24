//
//  DataStore.swift
//  SnapNews
//
//  Created by Nathan Lui on 3/18/21.
//

import Foundation
import Combine
import SwiftUI

class DataStore: ObservableObject {
    @Published var result: NYTSearchResponse?
    
    init() {
    }
    
    func getResults(for query: String) {
        getData(with: query) { (result) in
            self.result = result
        }
    }
    
   
        
}


