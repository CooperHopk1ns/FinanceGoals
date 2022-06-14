//
//  GoalView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

var goals: [Goal] = []

struct GoalView: View {
    var selected = 0
    var body: some View {
        VStack {
            Text("Goal #\(goals[selected].number + 1)")
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
