//
//  Extensions.swift
//  PaperToWeb
//
//  Created by Nathan Lui on 3/16/21.
//

import Foundation

//  Allows us to check to see if there is a value at an array index and gracefully handle if not. Used in checking the multimedia array in the
//  json, where there is sometimes no photo
//extension Collection where Indices.Iterator.Element == Index {
//    subscript (optional index: Index) -> Iterator.Element? {
//        return indices.contains(index) ? self[index] : nil
//    }
//}
