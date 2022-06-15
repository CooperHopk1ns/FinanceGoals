//
//  GoalView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

//Image Struct
struct imageStruct: Hashable {
    var id: Int
    var imageName: String
    var systemName: String
}
//Variables
var defaults = UserDefaults.standard
//Image Variables
var giftImage = imageStruct.init(id: 0, imageName: "Gift", systemName: "gift.fill")
var shoppingImage = imageStruct.init(id: 1, imageName: "Shopping", systemName: "bag.fill")
var creditImage = imageStruct.init(id: 2, imageName: "Credit", systemName: "creditcard.fill")
var moneyImage = imageStruct.init(id: 3, imageName: "Money", systemName: "banknote.fill")
//Testing Variables
var testGoal = Goal.init(number: 0, image: "bag.fill", description: "Test Goal", amountSaved: 50, amountTotal: 1000)
//Array Variables
var goals: [Goal] = []
var images: [imageStruct] = [giftImage, shoppingImage, creditImage, moneyImage]
//Goal View
struct GoalView: View {
    var selected = 0
    @State var amountToAdd = ""
    @State var amountToRemove = ""
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
                    HStack {
                    TextField("Enter an amount...", text: $amountToAdd)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                    Button(action: {
                        goals[selected].amountSaved += Int(amountToAdd) ?? 0
                        amountToAdd = ""
                        if let encoded = try? JSONEncoder().encode(goals) {
                            defaults.set(encoded, forKey: "goalsKey")
                        }
                    }) {
                       Text("Add Money")
                            .frame(width: 120)
                    }
                    .padding()
                    }
                    HStack {
                    TextField("Enter an amount...", text: $amountToRemove)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                    Button(action: {
                        goals[selected].amountSaved -= Int(amountToRemove) ?? 0
                        amountToRemove = ""
                        if let encoded = try? JSONEncoder().encode(goals) {
                            defaults.set(encoded, forKey: "goalsKey")
                        }
                    }) {
                        Text("Remove Money")
                            .frame(width: 120)
                    }
                    .padding()
                    }
                    Button(action: {
                        var counter = -1
                        for _ in goals {
                            counter += 1
                            if goals[selected].number + 1 == goals.count {
                                
                            } else {
                            goals[counter].number -= 1
                            print(goals[selected])
                                print(goals)
                            print("print")
                            }
                        }
                        goals.remove(at: selected)
                        if let encoded = try? JSONEncoder().encode(goals) {
                            defaults.set(encoded, forKey: "goalsKey")
                        }
                    }) {
                        Text("Delete Goal")
                            .foregroundColor(.red)
                    }
            }
            .padding()
        }
        .navigationTitle("Goal #\(goals[selected].number + 1)")
        .accessibilityIdentifier("goalView")
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
