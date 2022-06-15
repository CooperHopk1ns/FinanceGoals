//
//  ContentView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    //Variables
    @State private var showingAddGoal = false
    @State var goal = goals
    //UI
    var body: some View {
            VStack {
                NavigationView {
                            List((goal), id: \.self) { goal in
                                NavigationLink {
                                GoalView(selected: goal.number)
                                } label: {
                                    Label(goal.description, systemImage: goal.image)
                                    Text("$\(goal.amountSaved)/$\(goal.amountTotal)")
                                }
                                .accessibilityIdentifier("goalViewIndividual")
                            }
                            .refreshable {
                                if let goalData = defaults.data(forKey: "goalsKey") {
                                    let decodedGoalData = try? JSONDecoder().decode([Goal].self, from: goalData)
                                    goals = decodedGoalData ?? [testGoal]
                                }
                                goal = goals
                                print(goals)
                        }
                        .navigationTitle("Goals")
                    }
                //Button
            Button(action: {
                showingAddGoal.toggle()
            }) {
                HStack {
                Text("Add Goal")
                Image(systemName: "plus.circle")
                }
                .sheet(isPresented: $showingAddGoal) {
                    AddingGoalView()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
