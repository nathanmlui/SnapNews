//
//  GetFontNAmes.swift
//  PaperToWeb
//
//  Created by Nathan Lui on 3/23/21.
//

import Foundation
import SwiftUI


func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
