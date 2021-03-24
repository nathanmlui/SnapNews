//
//  DateFormatter.swift converts dates from ISO format to something like "Jun 12, 2021" so we can display it on the article card
//
//  SnapNews
//
//  Created by Nathan Lui on 3/8/21.
//

import Foundation

func formatDate(from ISOdate: String) -> String {
    
    let formatter = ISO8601DateFormatter()
    var convertedDate = ""
    
    if let date = formatter.date(from: ISOdate) {
        convertedDate = date.stringDate
    }
    return convertedDate
}

extension Date {

    var stringDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: self)
    }

}
