//
//  ContentView.swift
//  CoolBeans
//
//  Created by bo zhong on 8/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var history = History()
    @State private var showingAddScreen: Bool = false
    
    var totalCaffeine: Int {
        history.servings.map(\.caffeine).reduce(0, +)
    }
    
    var totalCalories: Int {
        history.servings.map(\.calories).reduce(0, +)
    }
    
    var body: some View {
        NavigationView{
            List {
                if history.servings.isEmpty {
                    Button("Add your first drink") {
                        showingAddScreen = true
                    }
                } else {
                    Section("Summary") {
                        Text("Caffeine: \(totalCaffeine)mg")
                        Text("Calories: \(totalCalories)cal")
                    }
                    
                    ForEach(history.servings) { serving in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(serving.name)
                                    .font(.headline)
                                Text(serving.description)
                            }
                            
                            Spacer()
                            
                            Text("\(serving.caffeine)mg")
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    history.delete(serving)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                withAnimation {
                                    history.reorder(serving)
                                }
                            } label: {
                                Label("Reorder", systemImage: "repeat")
                            }
                            .tint(.blue)


                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                MenuView.init()
            }
            .navigationTitle("Cool Beans")
            .toolbar {
                Button {
                    showingAddScreen = true
                } label: {
                    Label("Add a new drink", systemImage: "plus")
                }

            }
        }
        .environmentObject(menu)
        .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Menu())
    }
}
