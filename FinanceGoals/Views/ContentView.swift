//
//  ContentView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Goal 1")
                    Text("Goal 2")
                }
                HStack {
                    Text("Goal 3")
                    Text("Goal 4")
                }
                HStack {
                    Text("Goal 5")
                    Text("Goal 6")
                }
            }
            .navigationTitle("Goals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
