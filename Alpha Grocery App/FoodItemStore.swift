//
//  FoodItemStore.swift
//  Alpha Grocery App
//
//  Created by Chloe W Vilain on 2/23/16.
//  Copyright © 2016 Chloe W Vilain. All rights reserved.
//

import Foundation

class FoodItemStore {
    
    var allFoodItems = [FoodItem]()
    
    func createFoodItem() -> FoodItem {
        let newFoodItem = FoodItem(name: "Chloes food",quantity: 2)
        allFoodItems.append(newFoodItem)
        return newFoodItem
        
    }
    
    init() {
        for _ in 0..<5 {
            createFoodItem()
        }
    }
    
    
}
