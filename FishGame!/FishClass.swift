//
//  FishClass.swift
//  FishGame!
//
//  Created by Verdin on 2/17/23.
//

import Foundation
import SwiftUI

class Fish
{
    var name: String
    var imageString: String
    
    init()
    {
        self.name = "whale"
        self.imageString = "Placeholder"
    }
    
    init(name: String, imageString: String)
    {
        self.name = name
        self.imageString = imageString
    }
    
}
