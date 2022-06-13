//
//  GoalView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI
var testGoal = Goal.init(number: 1, image: "gift.fill", description: "gift for dad", amountSaved: 100, amountTotal: 500)
var testGoal2 = Goal.init(number: 2, image: "gift.fill", description: "gift for dad", amountSaved: 100, amountTotal: 500)

struct GoalView: View {
    var selected = 0
    var goals: [Goal] = [testGoal, testGoal2]
    var body: some View {
        VStack {
            Text("Goal #\(goals[selected].number)")
                Image(systemName: goals[selected].image)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(goals[selected].description)
                    .padding()
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
