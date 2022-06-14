//
//  GoalView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

struct imageStruct: Hashable {
    var id: Int
    var imageName: String
    var systemName: String
}

var defaults = UserDefaults.standard

var giftImage = imageStruct.init(id: 0, imageName: "Gift", systemName: "gift.fill")
var shoppingImage = imageStruct.init(id: 1, imageName: "Shopping", systemName: "bag.fill")
var creditImage = imageStruct.init(id: 2, imageName: "Credit", systemName: "creditcard.fill")
var moneyImage = imageStruct.init(id: 3, imageName: "Money", systemName: "banknote.fill")

var testGoal = Goal.init(number: 0, image: "bag.fill", description: "Monitor Arm", amountSaved: 50, amountTotal: 115)

var goals: [Goal] = []
var images: [imageStruct] = [giftImage, shoppingImage, creditImage, moneyImage]

struct GoalView: View {
    var selected = 0
    @State var amountToAdd = ""
    var body: some View {
        VStack {
            if goals[selected].amountSaved >= goals[selected].amountTotal {
                Text("Goal Completed!")
            }
                VStack {
                        Image(systemName: goals[selected].image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                    Text("\(goals[selected].description)")
                    }
                VStack {
                    Text("Amount Saved: $\(goals[selected].amountSaved)")
                        .padding()
                    Text("Amount Total: $\(goals[selected].amountTotal)")
                        .padding()
                    TextField("Enter an amount...", text: $amountToAdd)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        goals[selected].amountSaved += Int(amountToAdd) ?? 0
                        amountToAdd = ""
                        if let encoded = try? JSONEncoder().encode(goals) {
                            defaults.set(encoded, forKey: "goalsKey")
                        }
                    }) {
                       Text("Add Money")
                    }
            }
            .padding()
        }
        .navigationTitle("Goal #\(goals[selected].number + 1)")
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
