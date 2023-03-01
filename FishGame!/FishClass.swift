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
        self.imageString = "https://origin-east-01-drupal-fishwatch.woc.noaa.gov/sites/default/files/black-sea-bass-noaa-john-rosendale-sized.png"
    }
    
    init(name: String, imageString: String)
    {
        self.name = name
        self.imageString = imageString
    }
    
}
