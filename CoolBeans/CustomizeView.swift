//
//  CustomizeView.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import SwiftUI

struct CustomizeView: View {
    let drink: Drink
    
    @EnvironmentObject var menu: Menu 
    
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    
    let sizeOptions = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += extraShots * 65
        
        if isDecaf {
            caffeineAmount /= 20
        }
        
        return caffeineAmount

    }
    
    var calories: Int {
        var caloriesAmount = drink.baseCalories
        caloriesAmount += 10 * extraShots
        
        if drink.coffeeBased {
            caloriesAmount += milk.calories
        } else {
            caloriesAmount += milk.calories / 8
        }
        
        caloriesAmount += syrup.calories

        return caloriesAmount * (1 + size)
    }
    
    var body: some View {
        Form {
            Section("Basic Options") {
                Picker("Size", selection: $size) {
                    ForEach(sizeOptions.indices) { index in
                        Text(sizeOptions[index])
                    }
                }
                .pickerStyle(.segmented)
                
                
                if drink.coffeeBased {
                    Stepper("Extra Shots: \(extraShots)", value: $extraShots, in: 0...5)
                }
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            }
            
            Section("Customizations") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { milkOption in
                        Text(milkOption.name)
                            .tag(milkOption)
                    }
                }
                
                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { syrupOption in
                            Text(syrupOption.name)
                                .tag(syrupOption)
                        }
                    }
                }
                
            }
            
            
            
            Section("Estimates") {
                Text("**Caffeine:** \(caffeine) mg")
                Text("**Calories:** \(calories) kcal")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example)
            .environmentObject(Menu())
    }
}
