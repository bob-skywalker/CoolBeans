//
//  Drink.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import Foundation


struct Drink: Codable, Identifiable {
    let id: UUID
    let name: String
    let caffeine: [Int]
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int
    
    
    //computed property to get image names
    var image: String {
        let snakeCase = self.name.replacingOccurrences(of: " ", with: "-")
        return snakeCase.lowercased()
    }

    
    static let example = Drink(id: UUID(), name: "Example Drink", caffeine: [30, 50, 80], coffeeBased: false, servedWithMilk: true, baseCalories: 50)
     
}
