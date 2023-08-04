//
//  Serving.swift
//  CoolBeans
//
//  Created by Bo Zhong on 8/4/23.
//

import Foundation

struct Serving: Identifiable, Codable {
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
