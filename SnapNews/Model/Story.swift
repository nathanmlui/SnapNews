//
//  Article.swift
//  PaperToWeb
//
//  Created by Nathan Lui on 2/10/21.
//

import Foundation
import SwiftUI

struct Story: Decodable {
    //var id = UUID()
    var title: String
    var abstract: String
    var published_date: String
    var short_url: String
    var multimedia: String
    
    static let example = Story(
        title: "Will American Ideas Tear France Apart? Some of Its Leaders Think So",
        abstract: "Politicians and prominent intellectuals say social theories from the United States on race, gender and post-colonialism are a threat to French identity and the French republic.",
        published_date: "2021-02-09T05:00:19-05:00",
        short_url: "https://nyti.ms/3tGzAGM",
        multimedia: "france")
    
    
    
}

struct Story_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
