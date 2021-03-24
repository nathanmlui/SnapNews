//
//  Articles.swift
//  PaperToWeb
//
//  Created by Nathan Lui on 2/12/21.
//

import Foundation
import SwiftUI

class Stories: ObservableObject {
    let returned_stories: [Story]
    
    var primary: Story {
        returned_stories[0]
    }
    
    init() {
        let url = Bundle.main.url(forResource: "stories", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        returned_stories = try! JSONDecoder().decode([Story].self, from: data)
    }
    
}

struct Stories_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
