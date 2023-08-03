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

    
    static let example = Drink(id: UUID(), name: "Example Drink")
     
}
