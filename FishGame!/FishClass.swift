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
    var imageString: Array<Any>
    
    init()
    {
        self.name = "whale"
        self.imageString = ["grace.com"]
    }
    
    init(name: String, imageString: Array<Any>)
    {
        self.name = name
        self.imageString = imageString
    }
    
}
