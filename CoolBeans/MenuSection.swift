//
//  MenuSection.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
}
