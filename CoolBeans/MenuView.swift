//
//  MenuView.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { menuSection in
                        Section {
                            ForEach(menuSection.drinks) { drink in
                                VStack{
                                    Text(drink.name)
                                        .font(.system(.body, design: .serif))
                                }
                                .padding(.bottom)
                            }
                        } header: {
                            Text(menuSection.name)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity,
                                       alignment: .leading
                                )
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Add Drink")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}
