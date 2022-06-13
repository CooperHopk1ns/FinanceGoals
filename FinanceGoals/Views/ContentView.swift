//
//  ContentView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            VStack {
            NavigationView {
                    List() {
                        Group {
                            NavigationLink("Goal 1") {
                                GoalView.init(selected: 0)
                            }
                            NavigationLink("Goal 2") {
                                GoalView.init(selected: 1)
                            }
                        }
                    }
                .navigationTitle("Goals")
            }
            Button(action: {
                
            }) {
                HStack {
                Text("Add Goal")
                Image(systemName: "plus.circle")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
