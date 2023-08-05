//
//  MenuView.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { menuSection in
                        Section {
                            ForEach(menuSection.matches(for: searchText)) { drink in
                                NavigationLink {
                                    CustomizeView(drink: drink) {
                                        dismiss()
                                    }
                                } label: {
                                    VStack{
                                        Image(drink.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(15)
                                            .padding()
                                        
                                        Text(drink.name)
                                            .font(.system(.body, design: .serif))
                                            .padding(.bottom)
                                            .foregroundColor(.primary)
                                    }
                                    .padding(.bottom)
                                }

                            }
                        } header: {
                            Text(menuSection.name)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .padding(.leading)
                                .background(.background)
                        }
                    }
                }
                .navigationTitle("Add Drink")
                .searchable(text: $searchText)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}
