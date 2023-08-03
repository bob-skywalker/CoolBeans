//
//  Menu.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import Foundation

class Menu: ObservableObject, Codable {
    let sections: [MenuSection]
    
    init(){
        do {
            let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(Menu.self, from: data)
            self.sections = decodedData.sections
            
        } catch {
            fatalError("menu.json is missing or corrupted.")
        }
    }
    
    
}
