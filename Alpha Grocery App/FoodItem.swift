//
//  File.swift
//  Alpha Grocery App
//
//  Created by Chloe W Vilain on 2/23/16.
//  Copyright © 2016 Chloe W Vilain. All rights reserved.
//

import Foundation
import UIKit

class FoodItem: NSObject {
    var name: String
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
        super.init()

    }
    
}