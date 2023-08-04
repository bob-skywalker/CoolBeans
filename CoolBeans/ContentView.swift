//
//  ContentView.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    
    var body: some View {
        MenuView()
            .environmentObject(menu)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Menu())
    }
}
